{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dots needed for AwesomeWM from local repo
    file = {
      # AwesomeWM
      ".config/awesome" = {
        source = ../../dots/.config/awesome;
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
