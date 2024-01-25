{ config, pkgs, inputs, outputs, ... }:

{
  imports = [
    ./hardware.nix
    ../../de/xfce.nix
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
      jack = {
        enable = true;
      };
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
          package = [
            pkgs.OVMFFull.fd
          ];
        };
      };

      # Specify behavior on boot and shutdown
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

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
      Jerry = import ../../../home-manager/hosts/green-demon/default.nix;
    };
  };
}
