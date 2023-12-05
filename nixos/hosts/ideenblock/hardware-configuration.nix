{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci"];
      kernelModules = [];
    };

    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
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
  };

  swapDevices = [];

  networking = {
    useDHCP = lib.mkDefault true;

  #  interfaces = {
  #    wlp0s12f0 = {
  #      useDHCP = lib.mkDefault true;
  #    };
  #  };
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  hardware = {
    cpu = {
      intel = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}