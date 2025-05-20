{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fuzzel.nix
    ./kitty.nix
    ./neofetch.nix
    ./rofi.nix
    ./starship.nix
    ./swaync.nix
    ./waybar.nix
  ];

  home = {
    packages = with pkgs; [
      dconf
    ];
  };
}
