# green-demon specific config
{
  config, 
  pkgs, 
  ...
}: {
  
  # Imports specific to Green Demon
  imports = [
    ../../mounts.nix
    ../../dev-pkgs.nix
    ../../gaming.nix
  #  ../../awesomewm.nix
    ../../gnome.nix
  #  ../../hyprland.nix
  #  ../../kde.nix
    ../../obs.nix
  #  ../../qtile.nix
  #  ../../wayfire.nix
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

  # Hostname, networking and bluetooth
  networking = {
    # Specify hostname
    hostName = "Green-Demon";
  };

  # Enable hardware support
  hardware = {
    bluetooth.enable = true;
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

    # Add JACK support to PipeWire
    pipewire = {
      jack.enable = true;
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

	      ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
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
      ardour
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
