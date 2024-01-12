{
  description = "Dotfiles and configuration files for NixOS";

  inputs = {
    # List of repos:
    # nixpkgs -> NixOS Unstable channel
    # nixpkgs-stable   -> NixOS Stable channel (Currently Version 23.11)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    # Lanzaboote for Secure Boot support
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nh - Yet Another Nix Helper
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
  };

  outputs = inputs @ { self, nixpkgs, lanzaboote, ... }:

  {
    nixosConfigurations = let
      user = "Jerry";
      mkHost = host:
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs system user;
          };

          modules = [
            lanzaboote.nixosModules.lanzaboote

            ({ pkgs, lib, ... }: {
              
              environment.systemPackages = with pkgs; [
                sbctl
              ];
              
              boot = {
                loader = {
                  systemd-boot = {
                    enable = lib.mkForce false;
                  };
                };

                lanzaboote = {
                  enable = true;
                  pkiBundle = "/etc/secureboot";
                };
              };  
            })
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user} = {
                  imports = [
                    # common home-manager configuration
                    ./nixos/home.nix
                    # host specific home-manager configuration
                    ./nixos/hosts/${host}/home.nix
                    # other Home-Manager configurations
                    ./home-manager/home.nix
                  ];

                  home = {
                    username = user;
                    homeDirectory = "/home/${user}";
                    # do not change this value
                    stateVersion = "22.05";
                  };

                  # Let Home Manager install and manage itself.
                  programs.home-manager.enable = true;
                };
              };
            }
            # common configuration
            ./nixos/configuration.nix
            # host specific configuration
            ./nixos/hosts/${host}/configuration.nix
            # host specific hardware configuration
            ./nixos/hosts/${host}/hardware-configuration.nix
          ];
        };
    in {
      # update with `nix flake update`
      # rebuild with `nixos-rebuild switch --flake .#<INSERT HOST HERE>`
      aarch64-vm = mkHost "aarch64-vm";
      green-demon = mkHost "green-demon";
      hurricane = mkHost "hurricane";
      ideenblock = mkHost "ideenblock";
    };
  };
}
