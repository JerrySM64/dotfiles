{ config, lib, pkgs, ... }:

{
  config = {
    # Services specific to Xfce
    services = {
      # X11
      xserver = {
        enable = true;

        # Enable the SDDM Display Manager
        displayManager = {
          sddm = {
            enable = true;
          };
        };

        # Xfce joins the battle!
        desktopManager = {
          xfce = {
            enable = true;
          };
        };
      };

      # Enable GVFS
      gvfs = {
        enable = true;
      };
    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };
    };

    # Environment related things specific to Xfce
    environment = {

      # Session variables specific to Xfce
      sessionVariables = {
      };

      # Packages specific to Xfce
      systemPackages = with pkgs; [
        xfce.xfce4-whiskermenu-plugin
      ];

      # Variables specific to Xfce
      variables = {
      };
    };
  };
}
