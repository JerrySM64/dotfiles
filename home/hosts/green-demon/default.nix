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
}
