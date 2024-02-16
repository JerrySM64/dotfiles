{ config, lib, ... }:

let inherit (import ../../options.nix) nano; in
lib.mkIf (nano == false) {
  programs.nano.enable = false;
}
