{ pkgs, config, ... }:

{
  imports = [
    # Enable &/ Configure Programs
    ./alacritty.nix
    ./bash.nix
    ./discord.nix
    ./element.nix
    ./emacs.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kdenlive.nix
    ./kitty.nix
    ./neofetch.nix
    ./neovim.nix
    ./nextcloud.nix
    ./obs.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./telegram.nix
    ./waybar.nix
    ./swappy.nix
    ./swaylock.nix
    ./swaync.nix
    ./wezterm.nix
    ./zsh.nix

    # Place Home Files Like Pictures
    ./files.nix
  ];
}
