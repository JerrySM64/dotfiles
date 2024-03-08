{ config, lib, pkgs, ... }:

let
  inherit (import ../../options.nix) obs;
in
lib.mkIf (obs == true) {
  home.packages = [ pkgs.obs-studio ];
}
