{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [];
      luks = {
        devices = {
          "luks-root".device = "/dev/disk/by-uuid/0a68d24c-88eb-45f0-9797-ce3f5f904121";
          "luks-home" = {
            device = "/dev/disk/by-uuid/eabc3544-5f32-459b-a275-a34d0c1ae8e7";
            crypttabExtraOpts = [ "same-as-password" ];
          };
        };
      };
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-root";
      fsType = "btrfs";
    };

    "/home" = {
      device = "/dev/mapper/luks-home";
      fsType = "btrfs";
      options = [ "subvol=home" "x-systemd.device-timeout=0" ];
    };

    "/nix" = {
      device = "/dev/mapper/luks-root";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/95AE-1AB0";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
