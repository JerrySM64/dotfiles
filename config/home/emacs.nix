{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) emacs; in 
lib.mkIf (emacs == true) {
  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };
}
