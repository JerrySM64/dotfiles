{ pkgs, user, ... }:
let
  homeDirectory = "/home/${user}";
in
{
  imports = [
    ./hyprland.nix
    ./neovim.nix
  ];

  # Enable support for legacy distros
  targets = {
    genericLinux = {
      enable = true;
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;
  
  home = {
    inherit user homeDirectory;

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    stateVersion = "22.05";
  };
};  
