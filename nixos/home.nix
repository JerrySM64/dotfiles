{ config, lib, pkgs, ... }:

{
  home = {
    # Symlink dotfiles from local dotfiles repo
    file = {
      # Starship prompt
      ".config/starship.toml" = {
        source = ../dots/.config/starship.toml;
      };
      # Neofetch
      ".config/neofetch" = {
        source = ../dots/.config/neofetch;
        recursive = true;
      };
      # Z-Shell
      ".zshrc" = {
        source = ../dots/.zshrc;
      };
    };
  };
}
