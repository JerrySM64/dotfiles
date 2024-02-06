{ config, pkgs, inputs, system, security, ... }: 

{
  config = {
    services = {
      xserver = {
        enable = true;
        videoDrivers = [ "amdgpu" ];
        displayManager = {
          sddm = {
            enable = true;
            #theme = "${(pkgs.fetchFromGitHub {
            #  owner = "Kangie";
            #  repo = "sddm-sugar-candy";
            #  rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
            #  sha256 = "p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
            #})}";
          };
        };
        layout = "de";
        xkbVariant = "";
      };

      dbus = {
        enable = true;
      };
    };  

    # Wayfire joins the battle!
    programs.wayfire = {
      enable = true;
      plugins = with pkgs.wayfirePlugins; [
        wcm
        wf-shell
        wayfire-plugins-extra
      ];
    };

    # Polkit on Wayfire needs some extra love
    systemd = {
      user = {
        services = {
          polkit-gnome-authentication-agent-1 = {
            description = "polkit-gnome-authentication-agent-1";
            wantedBy = [
              "graphical-session.target"
            ];
            wants = [
              "graphical-session.target"
            ];
            after = [
              "graphical-session.target"
            ];
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
          xdg-desktop-portal-gtk
          xdg-desktop-portal-wlr
        ];
        wlr = {
          enable = true;
          settings = {
            screencast = {
              chooser_type = "simple";
              chooser_cmd = "${pkgs.slurp}/bin/slurp -f%o -or";
            };
          };
        };
      };
    };

    environment = {
      systemPackages = with pkgs; [
        alacritty
        ffmpeg
        ffmpegthumbnailer
        foot
        geany
        grim
        imagemagick
        kanshi
        kitty
        libsForQt5.qt5.qtgraphicaleffects
        libsForQt5.sddm-kcm
        light
        mako
        mpc-qt
        mpd
        mpv
        nwg-look
        pamixer
        pastel
        pavucontrol
        playerctl
        polkit_gnome
        pulsemixer
        pywal
        rofi
        slurp
        swaybg
        swayidle
        swaylock-effects
        sway-contrib.grimshot
        viewnior
        waybar
        wdisplays
        wf-recorder
        wlogout
        wl-clipboard
        xfce.thunar
        xfce.thunar-volman
        xfce.thunar-archive-plugin
        xfce.tumbler
        yad
      ];

      variables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        WLR_RENDERER_ALLOW_SOFTWARE = "1";
      };
    };
  };
}
