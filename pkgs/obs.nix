{ config, pkgs, ... }:

{
  config = {
    boot = {
      kernelModules = [
        "v4l2loopback"
      ];
      extraModulePackages = [
        config.boot.kernelPackages.v4l2loopback
      ];
    };

    environment = {
      systemPackages = with pkgs; [
        obs-studio
        obs-studio-plugins.input-overlay
        obs-studio-plugins.looking-glass-obs
        obs-studio-plugins.obs-gstreamer
        obs-studio-plugins.obs-livesplit-one
        obs-studio-plugins.obs-tuna
        obs-studio-plugins.obs-vaapi
        obs-studio-plugins.obs-vkcapture
        v4l-utils
      ];
    };
  };
}
