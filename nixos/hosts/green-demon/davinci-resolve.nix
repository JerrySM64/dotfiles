{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      libva
      libvdpau-va-gl
      mesa
      mesa.opencl
      vulkan-loader
      vulkan-validation-layers
    ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      clinfo
      davinci-resolve
      mesa-demos
      vulkan-tools
    ];

    variables = {
      RUSTICL_ENABLE = "radeonsi";
      ROC_ENABLE_PRE_VEGA = "1";
    };
  };
}
