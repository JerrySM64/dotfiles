{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [];
      luks.devices."luks-0a68d24c-88eb-45f0-9797-ce3f5f904121".device = "/dev/disk/by-uuid/0a68d24c-88eb-45f0-9797-ce3f5f904121";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-0a68d24c-88eb-45f0-9797-ce3f5f904121";
      fsType = "btrfs";
    };

    "/home" = {
      device = "/dev/mapper/luks-0a68d24c-88eb-45f0-9797-ce3f5f904121";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

    "/nix" = {
      device = "/dev/mapper/luks-0a68d24c-88eb-45f0-9797-ce3f5f904121";
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
