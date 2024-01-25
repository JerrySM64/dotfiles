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
  };
}
