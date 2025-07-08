{ config, pkgs, inputs, outputs, ... }:

{
  imports = [
     ./hardware.nix
     ./openrgb.nix
   #  ../../wm/awesomewm.nix
   #  ../../wm/hyprland.nix
     ../../wm/niri.nix
   #  ../../wm/qtile.nix
     ../../../pkgs/dev.nix
     ../../../pkgs/fonts.nix
     ../../../pkgs/system.nix
     ../../../pkgs/hosts/green-demon/system.nix
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    # Use Zen Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Add Green Demon's kernel parameters
    kernelParams = [
      "pcie_acs_override=downstream,multifunction"
    ];

    # Specify the kernel modules to blacklist
    blacklistedKernelModules = [
      # "amdgpu"
      "nouveau"
      "nvidia"
      "nvidiafb"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
      "radeon"
    ];
  };

  # Hostname
  networking = {
    hostName = "Green-Demon";
  };

  # Hardware support
  hardware = {
    # Bluetooth
    bluetooth = {
      enable = true;
    };
  };

  # Man, I love services. I want some more!
  services = {
    pipewire = {
    };
  };

  # QEMU/KVM & Podman
  virtualisation = {
    # QEMU/KVM via libvirt daemon
    libvirtd = {
      enable = true;
      # Extra QEMU options
      qemu = {
        runAsRoot = true;
        swtpm = {
          enable = true;
        };

        # Secure Boot support in the OVMF package
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };

      # Specify behavior on boot and shutdown
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    containers.enable = true;

    # Podman for containers
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };

  # Environment related things
  environment = {
    sessionVariables = {
      LIBVIRT_DEFAULT_URI = [
        "qemu:///system"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      jerry = import ../../../home-manager/hosts/green-demon/default.nix;
    };
  };
}
