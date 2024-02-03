{ config, pkgs, ... }:

{
  home = {
    file = {
      ".config/neofetch/config.conf" = {
        source = ../files/neofetch.conf;
      };
    };
  };
}
