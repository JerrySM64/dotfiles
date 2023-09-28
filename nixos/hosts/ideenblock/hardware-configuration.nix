{
  config, 
  lib, 
  pkgs, 
  modulesPath, 
  ...
}:

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
      device = "/dev/disk/by-uuid/f46b56ba-940c-4a08-ac51-f44b31d90dbb";
      fsType = "xfs";
    };

    "/boot" = {
        device = "/dev/disk/by-uuid/813F-34E9";
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