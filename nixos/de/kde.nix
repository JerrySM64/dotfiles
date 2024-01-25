{ config, pkgs, ... }: 
  
{
  config = {
    services = {
      xserver = {
        enable = true;
        displayManager.sddm = {
          enable = true;
        #  defaultSession = "plasmawayland";
        };
        desktopManager.plasma5.enable = true;
      };

      # fwupd service
      fwupd.enable = true;

    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-kde
        ];
      };
    };

    # KDE-specific packages
    environment = {
      systemPackages = with pkgs; [
        kate
        kcalc
        kcharselect
        kdenlive
        libsForQt5.kwallet-pam
        pciutils
      ];
    };
  };
}
