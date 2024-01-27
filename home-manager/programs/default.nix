{ config, lib, pkgs, ... }:

{
  imports = [
    ./neofetch.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
  ];

  home = {
    packages = with pkgs; [
      dconf
      gnome.dconf-editor
    ];
  };
}
