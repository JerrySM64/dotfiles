{ config, lib, pkgs, ... }:

{
  home = {
    file = {
      # Update Script
      ".local/share/updates.sh" = {
        source = ../../../dots/update-scripts/NixOS/hurricane/updates.sh;
      };
    };
  };
}
