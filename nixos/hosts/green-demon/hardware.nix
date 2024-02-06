{ config, lib, modulesPath, pkgs, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sr_mod"
      ];

      kernelModules = [

      ];
    };

    kernelModules = [
      "kvm-amd"
    ];
    extraModulePackages = [

    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "xfs";
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

    "/home" = {
      device = "/dev/disk/by-label/Home";
      fsType = "xfs";
    };
  };

  swapDevices = [

  ];

  networking = {
    useDHCP = lib.mkDefault true;
  #  interfaces = {
  #    eno1 = {
  #      useDHCP = lib.mkDefault true;
  #    };

  #    wlp5s0 = {
  #      useDHCP = lib.mkDefault true;
  #    };
  #  };
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  hardware = {
    cpu = {
      amd = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}
