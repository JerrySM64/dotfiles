{ config, lib, username, ... }:

let inherit (import ../../options.nix) adb; in
lib.mkIf (adb == true) {
  programs.adb.enable = true;
  users.users.${username}.extraGroups = [ "adbusers" ];
}
