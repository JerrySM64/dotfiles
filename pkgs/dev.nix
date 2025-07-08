{ config, pkgs, ... }:

{
  imports = [
    ../nixos/users/dev.nix
  ];

  config = {
    services = {
      emacs = {
        enable = true;
        package = pkgs.emacs-gtk;
        install = true;
      };

      ollama = {
        enable = true;
        acceleration = "rocm";
        loadModels = [ "deepseek-r1:70b" ];
      };
    };

    programs = {
      adb = {
        enable = true;
      };

      direnv = {
        enable = true;

        nix-direnv = {
          enable = true;
        };
      };
    };

    environment = {
      systemPackages = with pkgs; [
        cmake
        distrobox
        gh
        gitFull
        github-desktop
        gnumake
        libtool
        nix-prefetch-scripts
        pkg-config
        python311Full
        rustup
      ];
    };
  };
}
