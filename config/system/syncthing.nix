{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) syncthing username userHome; in
lib.mkIf (syncthing == true) {
  services = {
    syncthing = {
      enable = true;
      user = "${username}";
      dataDir = "/home/${username}";
      configDir = "/home/${username}/.config/syncthing";
    };
  };
}
