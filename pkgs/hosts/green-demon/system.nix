{ config, pkgs, ... }:

{
  # System packages
  environment = {
    systemPackages = with pkgs; [
      anydesk
      ardour
      blender
      brasero
      distrobox
      gimp
      inkscape
      krita
      libratbag
      mpv
      qjackctl
      spotify
      virt-manager
      virt-viewer
    ];
  };
}
