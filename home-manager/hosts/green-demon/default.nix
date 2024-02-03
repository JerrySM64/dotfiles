{ config, lib, pkgs, ... }:

{
  imports = [
    ./shell/default.nix
  ];

  home = {
    file = {
      # Make the update command work right out of the box
      ".local/share/updates.sh" = {
        source = ../../files/update-scripts/green-demon/updates.sh;
      };
    };
  };
}
