{ config, lib, pkgs, nodejs-v, ... }:

let inherit (import ../../options.nix) nodejs; in
lib.mkIf (nodejs == true) {
  environment.systemPackages = with pkgs;
    [ "nodejs_${nodejs-v}" ];
}
