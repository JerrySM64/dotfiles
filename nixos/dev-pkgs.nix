{ config, pkgs, ... }: 

{
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
    
    users = {
      users = {
        Jerry = {
          extraGroups = [
            "adbusers"
          ];
        };
      };
    };

    environment.systemPackages = with pkgs; [
      cmake
      gh
      gitFull
      github-desktop
      gnat13
      gnumake
      libtool
      nodejs_21
      nix-prefetch-scripts
      pkg-config
      python311Full
      vscodium
    ];
  };
}
