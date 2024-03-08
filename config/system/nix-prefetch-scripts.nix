{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) nix-prefetch-scripts; in
lib.mkIf (nix-prefetch-scripts == true) {
  environment.systemPackages = [ pkgs.nix-prefetch-scripts ];
}
