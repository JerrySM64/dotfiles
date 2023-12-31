{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dots needed for Hyprland from local repo
    file = {
      # Hyprland
      ".config/hypr" = {
        source = ../../dots/.config/hypr;
        recursive = true;
      };
      # Waybar
      ".config/waybar" = {
        source = ../../dots/.config/waybar;
        recursive = true;
      };
      # Kitty
      ".config/kitty" = {
        source = ../../dots/.config/kitty;
        recursive = true;
      };
      # Rofi
      ".config/rofi" = {
        source = ../../dots/.config/rofi;
        recursive = true;
      };
    };
  };
}
