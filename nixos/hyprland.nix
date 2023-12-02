# This file is heavily based on the hyprland.nix file written by Lin Xianyi.
# HUGE shoutout to him/her for letting me base my file off of his/her one!
# Be sure to check him/her out: https://github.com/iynaix

{ config, pkgs, inputs, system, security, ... }: 
  
{
  config = {
    services.xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager.sddm = {
        enable = true;
        theme = "${(pkgs.fetchFromGitHub {
          owner = "Kangie";
          repo = "sddm-sugar-candy";
          rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
          sha256 = "p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
        })}";
      };
      layout = "de";
      xkbVariant = "";
    };

    # locking with swaylock
    security.pam.services.swaylock = {
      text = "auth include login";
    };

    # Hyprland joins the battle!
    programs.hyprland.enable = true;

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
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-kde
        ];
      };
    };

    # Hyprland-specific packages
    environment.systemPackages = with pkgs; [
      dunst
      ffmpeg
      ffmpegthumbnailer
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.sddm-kcm
      kitty
      nordic
      nwg-look
      pamixer
      papirus-icon-theme
      pavucontrol
      playerctl
      polkit_gnome
      swaybg
      swaylock-effects
      sway-contrib.grimshot
      viewnior
      waybar
      wlogout
      wl-clipboard
      wofi
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.tumbler
    ];
  };
}
