{ ... }:
{
  programs.hyprpanel = {
    enable = true;
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    settings = {
      scalingPriority = "both";
      wallpaper.image = "/home/jerry/Pictures/Kelp Dome.jpg";
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;
        clock.format = "%a %d %b  %H:%M:%S";
        battery.label = true;
        notifications.show_total = true;
        workspaces.monitorSpecific = true;

        network = {
          label = true;
          showWifiInfo = false;
          truncation = true;
        };

        systray.ignore = [
          "blueman"
        ];

        media = {
          truncation = true;
          truncation_size = "50";
          show_label = true;
          format = "{title}";
          show_active_only = true;
        };

        layouts = {
          "HDMI-A-1" = {
            left = [
              "dashboard"
              "workspaces"
              "media"
            ];
            middle = [ 
              "windowtitle"
            ];
            right = [
              "systray"
              "volume"
              "bluetooth"
              "clock"
              "notifications"
            ];
          };

          "DP-2" = {
            left = [
              "dashboard"
              "workspaces"
              "media"
            ];
            middle = [ 
              "windowtitle"
            ];
            right = [
              "systray"
              "volume"
              "bluetooth"
              "clock"
              "notifications"
            ];
          };

          "HDMI-A-2" = {
            left = [
              "dashboard" 
              "workspaces"
              "windowtitle" 
            ];
            middle = [];
            right = [
              "volume"
              "clock" 
              "notifications" 
            ];
          };
        };
      };

      menus = {
        media.hideAuthor = true;
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather = {
            unit = "metric";
            location = "Groningen";
          };
        };

        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;

          powermenu = {
            name = "Jerry";
            icon = "/home/jerry/Pictures/penguins go yeet.gif";
          };

          shortcuts = {
            left = {
              shortcut1 = {
                command = "flatpak run app.zen_browser.zen";
                tooltip = "Zen Browser";
              };
              shortcut2 = {
                command = "env DESKTOPINTEGRATION=1 /home/jerry/AppImages/cider.appimage %U";
                icon = "";
                tooltip = "Cider";
              };
              shortcut3.command = "flatpak run com.discordapp.Discord";
              shortcut4.command = "fuzzel";
            };
            right.shortcut3.command = "hyprctl keyword animation 'fadeout,0,0,default'; grimblast copy area; hyprctl keyword animation 'fadeOut,1,4,default'; hyprpanel -q; hyprpanel";
          };
        };
      };

      theme = {
        bar = {
          transparent = true;
          floating = false;
          location = "top";
          outer_spacing = "0.2em";
          layer = "top";

          buttons = {
            enableBorders = true;
            windowtitle.enableBorder = false;
            volume.enableBorder = false;
            network.enableBorder = false;
            dashboard.enableBorder = false;
            background_opcaity = "80";
            modules = {
              microphone.enableBorder = false;
              ram.enableBorder = false;
            };
          };

          menus = {
            enableShadow = true;
            monochrome = false;
            menu.dashboard.scaling = "90";
          };

          osd = {
            orientation = "horizontal";
            location = "bottom";
          };
        };

        matugen = false;
        matugen_settings = {
          scheme_type = "content";
          variation = "standard_1";
        };

        font = {
          name = "JetBrains Mono Nerd Font";
          label = "JetBrains Mono Nerd Font Light";
          size = "16px";
        };
      };
    };
  };
}
