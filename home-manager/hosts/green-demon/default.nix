{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      dconf
      gnome.dconf-editor
    ];
  };
}
