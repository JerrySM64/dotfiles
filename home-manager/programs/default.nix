{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
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
