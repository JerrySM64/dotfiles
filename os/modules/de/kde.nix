{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.partitionmanager
    mpv
  ];

  # Workaround to not get spammed by baloo crashes
  systemd.user.services.kde-baloo.environment = {
    QT_QPA_PLATFORM = "offscreen";
  };
}
