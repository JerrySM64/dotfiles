{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) podman; in
lib.mkIf (podman == true) {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
