# File for the Qtile Window Manager

{ config, pkgs, lib, python3Packages, ...}:

{
  config = {
    services = {
      xserver = {
        enable = true;

	      # Enable the SDDM Display Manager
        displayManager = {
          sddm = {
            enable = true;
          };
        };
        
	      # Enable the Qtile Window Manager
	      windowManager.qtile = {
          enable = true;
          backend = "wayland";
		      extraPackages = python3Packages: with python3Packages; [
		        qtile-extras
		        dbus-python
		      ];  
        };

	      # X11 configuration
	      ## Tell X11 which driver to use
	      videoDrivers = [ "amdgpu" ];
	      exportConfiguration = true;
	      config = lib.mkAfter ''
	        Section "Device"
	          Identifier "Device-amdgpu[0]"
	          Driver "amdgpu"
	          Option "VariableRefresh" "true"
	          Option "AsyncFlipSecondaries" "true"
	        EndSection

	        Section "Screen"
	          Identifier "Screen-amdgpu-[0]
	          Device "Device-amdgpu[0]"
	          Option "VariableRefresh" "true"
	          Option "AsyncFlipSecondaries" "true"
	        EndSection
	      '';
      };

      # GVFS Support
      gvfs = {
        enable = true;
	      package = lib.mkForce pkgs.gnome.gvfs;
      };
    };

    # Polkit on Hyprland needs some extra love
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };
    };

    # Qtile-specific packages
    environment.systemPackages = with pkgs; [
      bibata-cursors
      dunst
      feh
      ffmpeg
      ffmpegthumbnailer
      flameshot
      galculator
      imagemagick
      kitty
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.sddm-kcm
      lxappearance
      networkmanagerapplet
      nordic
      # pa_applet
      papirus-icon-theme
      pavucontrol
      picom
      polkit_gnome
      pulsemixer
      python310Packages.cairocffi
      python311Packages.mpd2
      qgnomeplatform
      qgnomeplatform-qt6
      rofi
      xarchiver
      xfce.mousepad
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.tumbler
      xorg.xrandr
    ];
  };
}
