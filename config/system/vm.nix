{ pkgs, config, lib, ... }:

let inherit (import ../../options.nix) gpuType; in
lib.mkIf ("${gpuType}" == "vm") {
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.spice-webdavd.enable = true;
}
