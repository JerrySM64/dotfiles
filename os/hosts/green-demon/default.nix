{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./nerd-fonts.nix
    ./udev-rules.nix
  ];

  # Bootloader + Kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    extraModprobeConfig = ''
      options kvm_amd nested=1
    '';

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Networking
  networking = {
    firewall.trustedInterfaces = [ "virbr0" ];
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

    # KDE Plasma + SDDM
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

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

  security.rtkit.enable = true;

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
          libadwaita
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
        gtk4
        libadwaita
      ];
    };

    virt-manager.enable = true;
    zsh.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."jerry" = {
    shell = pkgs.zsh;
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate
      vesktop
    ];
  };

  environment.systemPackages = with pkgs; [
    swtpm
  ];
}
