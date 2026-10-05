{
  description = "Flake rewrite for NixOS configuration";

  inputs = {
    # NixOS Unstable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nixpkgs Stable (Currently NixOS 26.05)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    # Lanzaboote for Secure Boot support
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    lanzaboote,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    nixosConfigurations = {
      Green-Demon = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          # Secure Boot Support
          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {
            environment.systemPackages = [
              pkgs.sbctl
            ];

            boot = {
              loader.systemd-boot.enable = lib.mkForce false;
              lanzaboote = {
                enable = true;
                pkiBundle = "/var/lib/sbctl";
              };
            };
          })

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs outputs; };
              users."jerry" = {
                imports = [
                  ./home/default.nix
                  ./home/hosts/green-demon/default.nix
                ];
              };
            };
          }

          # Configuration files
          ./os/default.nix
          ./os/hosts/green-demon/default.nix
        ];
      };
    };
  };
}
