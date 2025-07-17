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
      krita
      libratbag
      mpv
      remmina
      virt-manager
      virt-viewer
    ];
  };
}
