{ config, pkgs, ... }:

{
  home = {
    file = {
      ".config/fastfetch/config.jsonc" = {
        source = ../files/fastfetch.jsonc;
      };
    };
  };
}
