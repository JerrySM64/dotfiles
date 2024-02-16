{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) element; in 
lib.mkIf (element == true) {
  home.packages = [pkgs.element-desktop];
}
