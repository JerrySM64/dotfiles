{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) discord; in 
lib.mkIf (discord == true) {
  home.packages = [pkgs.discord];
}
