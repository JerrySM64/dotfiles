# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, inputs, ... }:

{ 
  # Bootloader, Kernel, Params and modules
  boot = {
    # Specify kernel modules that are being loaded on all devices
    kernelModules = ["zram"];

    # Disable swraid to get rid of the warning
    swraid.enable = false;

    # Increase the vm.max_map_count 
    kernel = {
      sysctl = {"vm.max_map_count" = 2147483642 ; "vm.swappiness" = 5; };
    };
  };

  networking = {
    # Wireless support via wpa_supplicant
    # wireless.enable = true;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };  

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services = {
    xserver = {
      layout = "de";
      xkbVariant = "";
      desktopManager = {
        # Bye bye xterm!
        xterm = {
          enable = false;
        };
      };
    };

    # Enable CUPS to print documents
    printing.enable = true;

    # Enable Flatpak support
    flatpak.enable = true;
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Settings for the Nix package manager
  nix = {
    # Enable the flake command
    extraOptions = "experimental-features = nix-command flakes";

    # Automatic garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    settings = {
      extra-substituters = [
        "https://viperml.cachix.org"
      ];
      extra-trusted-public-keys = [
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
      ];
    };
  };

  programs = {
    # Enable Z-Shell
    zsh = {
      enable = true;

      # Syntax Highlighting
      syntaxHighlighting = {
        enable = true;
      };

      # Autosuggestions
      autosuggestions = {
        enable = true;
        async = true;
        highlightStyle = "fg=cyan";
        strategy = ["completion"];
      };

      # Oh My Zsh
      ohMyZsh = {
        enable = true;
        plugins = [
          "history-substring-search"
          "systemd"
        ];
      };
    };

    # Bye bye Nano!
    nano = {
      enable = false;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      Jerry = {
        isNormalUser = true;
        description = "Jerry";
        extraGroups = ["networkmanager" "wheel"];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
      };
    };
  };

  # nixpkg config and options
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Enable Swap on ZRAM
  zramSwap = {
    enable = true;
    # Set the limit to double the RAM
    memoryPercent = 200;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      inputs.nh.packages.x86_64-linux.default
      brave
      btop
      cider
      conky
      discord
      evince
      eza
      firefox-wayland
      htop
      kitty
      libreoffice
      lm_sensors
      neofetch
      neovim
      ntfs3g
      onlyoffice-bin
      pciutils
      pfetch
      starship
      tdesktop
      unzip
      vlc
      wget
      xdg-user-dirs
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];

    # Set Session variables
    sessionVariables = {
      FLAKE = "/home/Jerry/Development/dotfiles";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  # Fonts
  fonts.packages = with pkgs; [
    dina-font
    fira-code
    fira-code-symbols
    jetbrains-mono
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
    vegur
  ];

  # Show the differences after a rebuild.
  system = {
    activationScripts = {
      diff = {
        supportsDryActivation = true;
        text = ''
          ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
        '';
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  # TL;DR: Don't change this value! It determines the version this config was
  # created with, NOT the version you're actually running!
  system.stateVersion = "22.05"; # Did you read the comment?
}
