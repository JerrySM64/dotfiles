# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./mounts.nix
      ./dev-pkgs.nix
      ./gaming.nix
      ./awesomewm.nix
      # ./hyprland.nix
      # ./kde.nix
      # ./qtile.nix
    ];

  # Bootloader, Kernel, Params and modules
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #Disable swraid to get rid of the warning
    swraid.enable = false;
  
    kernelPackages = pkgs.linuxPackages_zen; 
    kernelParams = [ "amd-iommu=on" ];
    blacklistedKernelModules = [
    #  "radeon"
    #  "amdgpu"
      "nouveau"
      "nvidia"
      "nvidiafb"
      "nvidia_drm"
      "nvidia_uvm"
      "nvidia_modeset"
    ];
  };

  # Hostname
  networking.hostName = "Green-Demon"; 

  # Wireless support via wpa_supplicant
  # networking.wireless.enable = true; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth support
  hardware.bluetooth.enable = true;

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

  # NVIDIA Driver
  #  services.xserver.videoDrivers = [ "nvidia" ];
  #  hardware.opengl.enable = true;
  #  hardware.nvidia = {
  #    package = config.boot.kernelPackages.nvidiaPackages.latest;
  #    modesetting = {
  #      enable = true;
  #    };
  #  };

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Enable dconf
  programs.dconf.enable = true;
  
  # QEMU/KVM, VirtualBox & Podman
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
	runAsRoot = true;
      };
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    # virtualbox.host = {
    #   enable = true;
    #   enableExtensionPack = true;
    # };

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  # Environment Variables
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
  };

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
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable Z-Shell
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      Jerry = {
        isNormalUser = true;
        description = "Jerry";
        extraGroups = [ "networkmanager" "wheel" "libvirt" "kvm" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
      };
    };  

    groups = {
      libvirtd = {
        members = [ "root" "Jerry" ];
      };
    };    
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ardour
    blender
    brave
    btop
    cider
    conky
    discord
    distrobox
    dolphin-emu
    evince
    eza
    firefox-wayland
    gimp
    htop
    inkscape
    libreoffice
    lite-xl
    neofetch
    neovim
    ntfs3g
    nvtop
    onlyoffice-bin
    openboardview
    pfetch
    qjackctl
    starship
    tdesktop
    thunderbird
    unzip
    virt-manager
    vlc
    wget
    win-virtio
    xdg-user-dirs
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    jetbrains-mono
    nerdfonts
  ];

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
  system.stateVersion = "23.05"; # Did you read the comment?

}
