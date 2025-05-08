# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ../pkgs/default.nix
    ../pkgs/system.nix
    ../pkgs/fonts.nix
    ./users/default.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  environment = {
    etc =
      lib.mapAttrs'
        (name: value: {
          name = "nix/path/${name}";
          value = {
            source = value.flake;
          };
        })
        config.nix.registry;
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };

    # Automatic garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than-3d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = [
      "/etc/nix/path"
    ];
  };

  # FIXME: Add the rest of your current configuration

  boot = {
    # Use systemd-boot as the bootloader
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    # Specify kernel modules to load on all devices.
    kernelModules = [
      "zram"
    ];

    # Disable swraid to get rid of the warning, we used to get when 23.11 was the
    # unstable branch. Probably not needed anymore, but doesn't hurt to keep.
    swraid = {
      enable = false;
    };

    kernel = {
      # Increase the vm.max_map_count
      sysctl = {
        "vm.max_map_count" = 2147483642;
        "vm.swappiness" = 5;
      };
    };
  };

  # Set hardware related stuff
  hardware  = {
    # Disable PulseAudio. We're going to use PipeWire.
    pulseaudio = {
      enable = false;
    };
  };

  # Set up networking
  networking = {
    # Enable Network Manager
    networkmanager = {
      enable = true;
    };

    # Firewall
    firewall = {
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    };
  };
  # Set your time zone
  time = {
    timeZone = "Europe/Berlin";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  # Enable services
  services = {
    xserver = {
      # Set keyboard layout in GUI
      layout = "de";
      xkb = {
        variant = "";
      };

      desktopManager = {
        xterm = {
          enable = false; # Bye bye, Xterm!
        };
      };

      # Enable touchpad support
      libinput = {
        enable = true;
      };
    };

    # Enable CUPS to print documents
    printing = {
      enable = true;
    };

    # Enable Flatpak
    flatpak = {
      enable = true;
    };

    # This setups a SSH server. Very important if you're setting up a headless system.
    # Feel free to remove if you don't need it.
    openssh = {
      enable = true;
      settings = {
        # Forbid root login through SSH
        PermitRootLogin = "no";
        # Use keys only. Remove if you want to SSH using a password (not recommended)
        PasswordAuthentication = false;
      };
    };

    # Enable PipeWire
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };
  };

  # Set keyboard layout in TTY
  console = {
    keyMap = "de";
  };

  # Enable sound
  sound = {
    enable = true;
  };

  # Set security options
  security = {
    # Enable rtkit
    rtkit = {
      enable = true;
    };
  };

  # Enable Swap on ZRAM
  zramSwap = {
    enable = true;
    # Set the limit to double the RAM (Completely overkill. Why am I doing it, again?)
    memoryPercent = 200;
  };

  # Environment related stuff goes here
  environment = {
    # Set session variables
    sessionVariables = {
      FLAKE = "/home/jerry/Development/dotfiles";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      jerry = import ../home-manager/default.nix;
    };
  };
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion

  # TL;DR: Don't change this value! It determines the version this config was
  # created with, NOT the one you're actually running!
  system.stateVersion = "22.05"; # Did you read the comment?
}
