{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dotfiles from local dotfiles repo
    file = {
      # Starship prompt
      ".config/starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/starship.toml";
      };
      # Neofetch
      ".config/neofetch" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dotfiles/dots/.config/neofetch";
        recursive = true;
      };
      # Z-Shell
      ".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/Jerry/Development/dots/.zshrc";
      };
    };
  };
}
