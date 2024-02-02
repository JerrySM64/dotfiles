{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./rofi.nix
    ./waybar.nix
  ];

  home = {
    packages = with pkgs; [
      dconf
      gnome.dconf-editor
    ];
  };
}
