{ config, pkgs, ... }:

{
  imports = [

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
