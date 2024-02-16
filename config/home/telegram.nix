{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) telegram; in 
lib.mkIf (telegram == true) {
  home.packages = [pkgs.telegram-desktop];
}
