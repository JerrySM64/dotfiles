{
  config,
  pkgs,
  ...  
}: {
  config = {
    services = {
      xserver = {
        enable = true;

        # Tell X11 which driver to use
        videoDrivers = ["amdgpu"];

        # Enable the GDM Display Manager
        displayManager.gdm = {
          enable = true; 
        };

        # Enable the GNOME Desktop Environment
        desktopManager.gnome = {
          enable = true;
        };

        # Enable the fwupd service
        fwupd.enable = true;
      };
    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gnome
        ];
      };
    };

    # Environment related things specific to GNOME
    environment = {
      
      # Session variables specific to GNOME
      sessionVariables = {

      };

      # Packages specific to GNOME
      systemPackages = with pkgs; [
        gnomeExtensions.appindicator
        gnomeExtensions.blur-my-shell
        gnomeExtensions.dash-to-dock
        gnomeExtensions.just-perfection
        gnomeExtensions.removable-drive-menu
        gnomeExtensions.vitals
        gnome-extension-manager
      ];
    };
  };
}