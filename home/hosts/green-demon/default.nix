{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
  ];

  xdg = {
    enable = true;
    userDirs.enable = true;
    mime.enable = true;
  };

  home.packages = with pkgs; [
    eza
    starship
    git
    pfetch-rs
  ];
}
