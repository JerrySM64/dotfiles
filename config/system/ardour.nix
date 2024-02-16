{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) ardour; in 
lib.mkIf (ardour == true) {
  services.pipewire.jack.enable = true;
  environment.systemPackages =  
  [ pkgs.ardour pkgs.qjackctl ];
}
