{ config, pkgs, ... }:

{
  imports = [
    ../../obs.nix
    ./game.nix
  ];

  # System packages
  environment = {
    systemPackages = with pkgs; [
      blender
      brasero
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
