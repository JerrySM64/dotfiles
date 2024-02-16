{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) ntfs; in 
lib.mkIf (ntfs == true) {
  environment.systemPackages = with pkgs; 
  [ntfs3g];
}
