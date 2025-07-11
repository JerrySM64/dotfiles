{ config, lib, pkgs, ... }: 
  
{
  services = {
    displayManager.gdm.enable = true;

    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };
  };

  # locking with swaylock
  security = {
    pam.services.swaylock.text = "auth include login";
    polkit.enable = true;
  };

  # Niri joins the battle!
  programs = {
    niri.enable = true;
    xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
  };    

  # Polkit on Niri needs some extra love
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
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

  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
    configPackages = [pkgs.niri];
  };

  # Hyprland-specific packages
  environment = {
    systemPackages = with pkgs; [
      ffmpeg
      ffmpegthumbnailer
      fuzzel
      grimblast
      kitty
      pamixer
      pavucontrol
      playerctl
      polkit_gnome
      swaybg
      swaylock-effects
      swaynotificationcenter
      viewnior
      waybar
      wlogout
      wl-clipboard
      xarchiver
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.tumbler
      xwayland-satellite
    ];
    
    variables = {
      POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
