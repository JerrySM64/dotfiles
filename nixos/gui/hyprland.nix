{ config, pkgs, inputs, system, security, ... }: 
  
{
  config = {
    services = {
      xserver = {
        enable = true;
        displayManager.sddm = {
          enable = true;
        #  theme = "${(pkgs.fetchFromGitHub {
        #    owner = "Kangie";
        #    repo = "sddm-sugar-candy";
        #    rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
        #    sha256 = "p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
        #  })}";
        };
        layout = "de";
        xkbVariant = "";
      };

      gvfs = {
        enable = true;
      };

      gnome = {
        gnome-keyring = {
          enable = true;
        };
      };
    };

    # locking with swaylock
    security = {
      pam = {
        services = {
          swaylock = {
            text = "auth include login";
          };
        };    
      };

      polkit = {
        enable = true;
      };
    };

    # Hyprland joins the battle!
    programs = {
      hyprland = {
        enable = true;
      };
    };    

    # Polkit on Hyprland needs some extra love
    systemd = {
      user = {
        services = {
          polkit-gnome-authentication-agent-1 = {
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
      };
    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ];
      };
    };

    # Hyprland-specific packages
    environment = {
      systemPackages = with pkgs; [
        dunst
        ffmpeg
        ffmpegthumbnailer
        grimblast
        libsForQt5.qt5.qtgraphicaleffects
        libsForQt5.sddm-kcm
        lxqt.lxqt-policykit
        kitty
        nwg-look
        pamixer
        pavucontrol
        playerctl
        polkit_gnome
        rofi
        swaybg
        swaylock-effects
        viewnior
        waybar
        wlogout
        wl-clipboard
        xarchiver
        xfce.thunar
        xfce.thunar-volman
        xfce.thunar-archive-plugin
        xfce.tumbler
      ];
      
      variables = {
        POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      };
    };
  };  
}
