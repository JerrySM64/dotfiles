{ config, inputs, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./modules.nix
  ];

  # Bootloader + Kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    kernel.sysctl = {
      "kernel.yama.ptrace_scope" = 0;
    };

    extraModprobeConfig = ''
      options kvm_amd nested=1
    '';

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  # Hardware-related
  hardware = {
    amdgpu.initrd.enable = true;
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    steam-hardware.enable = true;
    uinput.enable = true;
  };

  nixpkgs.config.rocmSupport = true;

  # Networking
  networking = {
    firewall = {
      trustedInterfaces = [ "virbr0" ];
      allowedUDPPorts = [ 58000 ];
    };

    hostName = "Green-Demon";
  };

  # Services
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Sound
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    wrappers.pkexec = {
      setuid = true;
      owner = "root";
      group = "root";
      source = "${pkgs.polkit.out}/bin/pkexec";
    };
  };

  # QEMU/KVM
  virtualisation.libvirtd.enable = true;

  # Programs
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: with pkgs; [
          gtk4
          icu
          libadwaita
          libnghttp2
          qt6.qtbase
        ];
      };
    };

    firefox = {
      enable = true;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFeedbackCommands = true;

        Sync = {
          Enabled = true;
        };

        NewTabPage = {
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          SponsoredPocket = false;
          Snippets = false;
        };
      };

      preferences = {
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.ai.control.default" = "blocked";
        "browser.ml.enable" = false;
        "browser.tabs.organization.enabled" = false;
        "browser.ai.control.linkPreviewKeyPoints" = "blocked";
        "browser.ai.control.translations" = "allowed";
        "browser.translations.enable" = true;
        "browser.newtabpage.activity-stream.showSearch" = true;
        "browser.newtabpage.activity-stream.showTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glib
        gtk4
        libadwaita
        qt6.qtbase
      ];
    };

    obs-studio = {
      enable = true;
      enableVirtualCamera = false;
      plugins = with pkgs.obs-studio-plugins; [
        obs-gstreamer
        obs-livesplit-one
        obs-pipewire-audio-capture
        obs-tuna
        obs-vaapi
        obs-vkcapture
        obs-wayland-hotkeys
      ];
    };

    squidmod.enable = true;
    virt-manager.enable = true;
    zsh.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."jerry" = {
    shell = pkgs.zsh;
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [
      element-desktop
      endeavour
      filezilla
      # gearlever
      ghidra-bin
      kdePackages.kleopatra
      nomacs
      novafetch
      onefetch
      spoon-save-editor
      vesktop

      # Custom packages
      (callPackage ../../pkgs/cemu.nix { })
    ];
  };

  environment.systemPackages = with pkgs; [
    swtpm
  ];
}
