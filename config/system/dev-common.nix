{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) common; in
lib.mkIf (common == true) {
  environment.systemPackages = with pkgs; [
    cmake
    gnat13
    gnumake
    libtool
    pkg-config
  ];
}
