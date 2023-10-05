# Configuration specific to the harmless hurricane
{
  config,
  pkgs,
  ...
}: {

  # Imports specific to the harmless hurricane
  imports = [
    ../../mounts.nix
    ../../dev-pkgs.nix
    ../../gaming.nix
    # ../../awesomewm.nix
    ../../gnome.nix
    # ../../hyprland.nix
    # ../../kde.nix
    # ../../qtile.nix
  ];

  # Bootloader has to be done per machine, since the ThinkPad doesn't 
  # support UEFI.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_zen;

    # Add Green Demon's kernel parameters
    kernelParams = ["pcie_acs_override=downstream,multifunction"];
  };

  # Hostname, networking and bluetooth
  networking = {
    # Specify hostname
    hostName = "Crash-Demon";
  };

  # Enable hardware support
  hardware = {
    # Bluetooth support
    bluetooth = {
      enable = true;
    };

    # NVIDIA Driver
    opengl = {
      enable = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting = {
        enable = true;
      };
    };
  };
  
  # Services are good. Services are great. We should use them!
  services = {
    # Enable printing service via CUPS
    printing = {
      enable = true;
      # Add drivers for HP printer support
      drivers = with pkgs; [
        hplip
      ];
    };

    # X11 settings specific to the harmless hurricane
    xserver = {
      videoDrivers = [nvidia];
    };
  };

  # QEMU/KVM & Podman
  virtualisation = {
    
    # QEMU/KVM via libvirt daemon
    libvirtd = {
      enable = true;
      
      # Extra QEMU options
      qemu = {
        swtpm.enable = true;
	      ovmf.enable = true;
	      runAsRoot = true;
      };

      # Specify behavior on boot and shutdown
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    # Podman for containers
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  # User account related things specific to Green Demon
  users = {
    users = {
      Jerry = {
        extraGroups = ["libvirt" "kvm"];
      };
    };

    groups = {
      libvirtd = {
        members = ["root" "Jerry"];
      };
    };
  };

  # Environment related things specific to Green Demon
  environment = {
    
    # Environment variables
    sessionVariables = {
      LIBVIRT_DEFAULT_URI = ["qemu:///system"];
    };

    # Packages specific to Green Demon
    systemPackages = with pkgs; [
      blender
      distrobox
      gimp
      inkscape
      libratbag
      nvtop
      openboardview
      qjackctl
      virt-manager
      win-virtio
    ];
  };
}