# configuration.nix specific to ideenblock

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../kde.nix
  ];

  boot = {
    # Bootloader
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    # Plymouth Boot Screen
    plymouth =  {
      enable = true;
      theme = "breeze";
    };

  #  initrd = {
  #    systemd = {
  #      enable = true;
  #    };
  #  };

    # Kernel
    kernelParams = ["quiet"];
    kernelPackages = pkgs.linuxPackages_zen;

    # Kernel Modules to blacklist
    blacklistedKernelModules = [
      "elan_i2c"
    ];
  };

  # Hardware related stuff
  hardware = {
    bluetooth = {
      enable = true;
    };

    pulseaudio = {
      enable = false;
    };
  };

  # Services
  services = {
    # Enable printing service via CUPS
    printing = {
      enable = true;
      # Add drivers for HP printer support
      drivers = with pkgs; [
        hplip
      ];
    };
  };

  # User account related things specific to Green Demon
  users = {
    users = {
      Jerry = {
        extraGroups = [];
      };
    };

    groups = {
    };
  };

  environment = {
    systemPackages = with pkgs; [
      
    ];
  };
}