{ pkgs, config, ... }:

let
  inherit (import ../../options.nix) obs biosType legacyGrubDevice;
in
{
  boot =
    if (obs == true) then {
      loader =
        if (biosType == "legacy") then {
          grub = {
            enable = true;
            device = "${legacyGrubDevice}";
            useOSProber = true;
            configurationLimit = 8;
          };
        } else {
          systemd-boot = {
            enable = true;
            configurationLimit = 8;
          };
        };
      kernelModules = [ "v4l2loopback" ];
      extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    } else {
      loader =
        if (biosType == "legacy") then {
          grub = {
            enable = true;
            device = "${legacyGrubDevice}";
            useOSProber = true;
            configurationLimit = 8;
          };
        } else {
          systemd-boot = {
            enable = true;
            configurationLimit = 8;
          };
        };
    };
}
