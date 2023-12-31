{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dots needed for Hyprland from local repo
    file = {
      # Hyprland
      ".config/hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/hypr";
        recursive = true;
      };
      # Waybar
      ".config/waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/waybar";
        recursive = true;
      };
      # Kitty
      ".config/kitty" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/kitty";
        recursive = true;
      };
      # Rofi
      ".config/rofi" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/rofi";
        recursive = true;
      };
    };
  };
}
