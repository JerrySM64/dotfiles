{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dots needed for Qtile from local repo
    file = {
      # Qtile
      ".config/qtile" = {
        source = ../../dots/.config/qtile;
        recursive = true;
      };
      # Picom
      ".config/picom" = {
        source = ../../dots/.config/picom;
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
