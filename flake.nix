{
  description = "Dotfiles and configuration files for NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nixpkgs Stable in case it's needed (Currently NixOS 25.05)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    # Nixpkgs Unstable Small for faster updates to critical components
    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Nix Index Database
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lanzaboote for Secure Boot support
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    lanzaboote,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      green-demon = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          # > Secure Boot is needed for certain operating systems to be happy <
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

          # > Our main nixos configuration file <
          ./nixos/default.nix
          ./nixos/hosts/green-demon/default.nix
        ];
      };

      tiny-heater = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          # > Our main nixos configuration file <
          ./nixos/default.nix
          ./nixos/hosts/tiny-heater/default.nix
        ];
      };
    };

    homeConfigurations = {
      "jerry@green-demon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # nvf
          nix-index-database.hmModules.nix-index

          ./home-manager/default.nix
          ./home-manager/hosts/green-demon/default.nix
        ];
      };

      "jerry@tiny-heater" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # nvf
          nix-index-database.hmModules.nix-index

          ./home-manager/default.nix
          ./home-manager/hosts/tiny-heater/default.nix
        ];
      };
    };
  };
}
