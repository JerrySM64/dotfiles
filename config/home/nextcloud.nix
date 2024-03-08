{ config, lib, pkgs, username, ... }:

let inherit (import ../../options.nix) nextcloud; in
lib.mkIf (nextcloud == true) {
  home = {
    packages = with pkgs; [ nextcloud-client ];
  };
}	
