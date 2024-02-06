{ config, pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      package = pkgs.waybar;
      style = ''
        @define-color white                 rgba(242, 242, 242, 1.0);
        @define-color black                 rgba(0, 2, 3, 1.0);
        @define-color text                  rgba(190, 203, 203, 1.0);
        @define-color lightgray             rgba(104, 104, 104, 1.0);
        @define-color darkgray              rgba(53, 53, 53, 1.0);
        @define-color red                   rgba(243, 139, 168, 1.0);

        @define-color black-transparent-1   rgba(0, 0, 0, 0.1);
        @define-color black-transparent-2   rgba(0, 0, 0, 0.2);
        @define-color black-transparent-3   rgba(0, 0, 0, 0.3);
        @define-color black-transparent-4   rgba(0, 0, 0, 0.4);
        @define-color black-transparent-5   rgba(0, 0, 0, 0.5);
        @define-color black-transparent-6   rgba(0, 0, 0, 0.6);
        @define-color black-transparent-7   rgba(0, 0, 0, 0.7);
        @define-color black-transparent-8   rgba(0, 0, 0, 0.8);
        @define-color black-transparent-9   rgba(0, 0, 0, 0.9);
        @define-color black-solid           rgba(0, 0, 0, 1.0);

        * {
          font-family:                      JetBrains Mono Nerd Font, Material Design Icons Desktop;
          font-size:                        14px;
          font-weight:                      bold;
        }

        window#waybar {
          background-color:                 @black-transparent-8;
          color:                            @text;
          border-radius:                    0px;
        }

        tooltip {
          background:                       @black-transparent-9;
          border:                           1px solid @darkgray;
          border-radius:                    10px;
        }

        tooltip label {
          color:                            @text;
        }

        #workspaces {
          margin-top:                       0;
          margin-bottom:                    0;
          margin-right:                     5px;
        }

        #workspaces button {
          background-color:                 transparent;
          color:                            @text;
          padding:                          1px 8px;
          margin-top:                       5px;
          margin-bottom:                    5px;
          margin-left:                      5px;
          margin-right:                     5px;
          border-radius:                    20px;
          transition:                       all 0.3s ease;
        }

        #workspaces button:hover {
          box-shadow:                       inherit;
          text-shadow:                      inherit;
          background:                       transparent;
          border:                           1px solid @lightgray;
          color:                            @white;
          min-width:                        30px;
          transition:                       all 0.3s ease;
        }

        #workspaces button.focused,
        #workspaces button.active {
          border:                           1px solid @lightgray;
          color:                            @white;
          min-width:                        30px;
          transition:                       all 0.3s ease;
          animation:                        colored-gradient 10s ease infinite;
        }

        #workspaces button.urgent {
          background-color:                 @white;
          color:                            @black;
          transition:                       all 0.3s ease;
        }

        #custom-appmenu {
          color:                            @text;
          border:                           1px solid @lightgray;
          border-radius:                    20px;
          margin-top:                       5px;
          margin-bottom:                    5px;
          margin-left:                      5px;
          margin-right:                     5px;
        }

        #custom-appmenu button {
          background-color:                 transparent;
          transition:                       all 0.3s ease;
        }

        #custom-appmenu.hover {
          background-color:                 @lightgray;
          transition:                       all 0.3s ease;
          animation:                        colored-gradient 10s ease infinite;
        }

        #taskbar {
          border-radius:                    8px;
          margin-top:                       4px;
          margin-bottom:                    4px;
          margin-left:                      1px;
          margin-right:                     1px;
        }

        #taskbar button {
          color:                            @text;
          padding:                          1px 8px;
          margin-left:                      1px;
          margin-right:                     1px;
        }

        #taskbar button:hover {
          background:                       transparent;
          border:                           1px solid @darkgray;
          border-radius:                    8px;
          transition:                       all 0.3s ease;
          animation:                        colored-gradient 10s ease infinite;
        }

        #taskbar button.active {
          border:                           1px solid @darkgray;
          border-radius:                    8px;
          transition:                       all 0.3s ease;
          animation:                        colored-gradient 10s ease infinite;
        }

        #custom-launcher,
        #submap,
        #mode,
        #custom-kernel,
        #custom-temp,
        #cpu,
        #memory,
        #pulseaudio.audio,
        #pulseaudio.microphone,
        #network,
        #bluetooth,
        #clock,
        #custom-powermenu,
        #custom-notification {
          background-color:                 transparent;
          color:                            @text;
          padding:                          1px 8px;
          margin-top:                       5px;
          margin-bottom:                    5px;
          margin-left:                      5px;
          margin-right:                     5px;
          border-radius:                    20px;
          transition:                       all 0.3s ease;
        }

        #submap {
          border:                           0;
        }

        /* #custom-launcher {
          background-color:                 @darkgray;
        } */

        /* #custom-launcher:hover {
          color:                            @white;
        } */

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces button,
        .modules-left > widget:first-child > #taskbar button,
        .modules-left > widget:first-child > #custom-launcher,
        .modules-left > widget:first-child > #window,
        .modules-left > widget:first-child > #tray,
        .modules-left > widget:first-child > #cpu,
        .modules-left > widget:first-child > #memory,
        .modules-left > widget:first-child > #backlight,
        .modules-left > widget:first-child > #pulseaudio.audio,
        .modules-left > widget:first-child > #pulseaudio.microphone,
        .modules-left > widget:first-child > #network,
        .modules-left > widget:first-child > #bluetooth,
        .modules-left > widget:first-child > #battery,
        .modules-left > widget:first-child > #clock,
        .modules-left > widget:first-child > #custom-powermenu,
        .modules-left > widget:first-child > #custom-notification {
          margin-left: 5px;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces button,
        .modules-right > widget:last-child > #taskbar button,
        .modules-right > widget:last-child > #custom-launcher,
        .modules-right > widget:last-child > #window,
        .modules-right > widget:last-child > #tray,
        .modules-right > widget:last-child > #cpu,
        .modules-right > widget:last-child > #memory,
        .modules-right > widget:last-child > #backlight,
        .modules-right > widget:last-child > #pulseaudio.audio,
        .modules-right > widget:last-child > #pulseaudio.microphone,
        .modules-right > widget:last-child > #network,
        .modules-right > widget:last-child > #bluetooth,
        .modules-right > widget:last-child > #battery,
        .modules-right > widget:last-child > #clock,
        .modules-right > widget:last-child > #custom-powermenu,
        .modules-right > widget:last-child > #custom-notification {
          margin-right: 5px;
        }

        #tray {
          background-color:                 transparent;
          padding:                          1px 8px;
        }

        #tray > .passive {
          -gtk-icon-effect:                 dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect:                 highlight;
          background-color:                 @red
        }
      '';
    };
  };

  home = {
    file = {
      ".config/waybar/config" = {
        text = ''
          {
            "layer": "top",
            "height": 38,
            "margin-top": 0,
            "margin-bottom": 0,
            "margin-left": 0,
            "margin-right": 0,
            "spacing": 1,
            "gtk-layer-shell": true,
            "modules-left": [
              "custom/appmenu",
              "hyprland/workspaces",
              "hyprland/window"
            ],
            "custom/notification": {
              "tooltip": false,
              "format": "{icon}",
              "format-icons": {
                "notification": "󱅫",
                "none": "󰂚",
                "dnd-notification": "󰂛",
                "dnd-none": "󰂛",
                "inhibited-notification": "󱅫",
                "inhibited-none": "󰂚",
                "dnd-inhibited-notification": "󰂛",
                "dnd-inhibited-none": "󰂛"
              },
              "return-type": "json",
              "exec-if": "which swaync-client",
              "exec": "swaync-client -swb",
              "on-click": "swaync-client -t -sw",
              "on-click-right": "swaync-client -d -sw",
              "escape": true
            },
            "clock": {
              "interval": 1,
              "format": "{:󰣆  %d. %b. %Y  󰥔  %H:%M} ",
              // "on-click": "gnome-calendar",
              "tooltip": false,
              "tooltip-format": "{calendar}",
              "calendar": {
                "mode": "year",
                "mode-mon-col": 3,
                "format": {
                  "today": "<span color='#0dbc79'>{}</span>"
                }
              }
            },
            "hyprland/workspaces": {
              "format": "{icon}",
              "format-icons": {
                "1": "1",
                "2": "2",
                "3": "3",
                "4": "4",
                "5": "5",
                "6": "6",
                "7": "7",
                "8": "8",
                "9": "9",
                "10": "10",
                "default": "1"
              },
              "no-click": "activate"
            },
            "modules-center": [
            ],
            "hyprland/window": {
              "format": "{:.200}",
              "separate-outputs": false,
              "on-click": "rofi -show window"
            },
            "modules-right": [
              "tray",
              "custom/kernel",
              "cpu",
              "custom/temp",
              "memory",
              "custom/notification",
              "pulseaudio#microphone",
              "pulseaudio#audio",
              "bluetooth",
              "network#wlo1",
              "network#enp42s0",
              "clock"
            ],
            "custom/kernel": {
              "format": "   {}",
              "interval": 3600,
              "exec": "uname -r",
              "signal": 8,
              "on-click": "kitty -e ~/.config/waybar/kernel-widget-function.sh"
            },
            "custom/appmenu": {
              "tooltip": false,
              "format": " Apps ",
              "on-click": "rofi -show drun"
            },
            "custom/temp": {
              "format": " {}°C",
              "interval": 5,
              "exec": "exec sensors | grep 'Tctl' | cut --characters 16-19",
              "on-click": "kitty -e btop"
            },
            "tray": {
              "icon-size":19,
              "spacing": 10
            },
            "cpu": {
              "format": "󰻠 {usage}%",
              "on-click": "btop",
              "tooltip": false
            },
            "memory": {
              "format": "󰍛 {used:0.1f}GB ({percentage}%) / {total:0.1f}GB",
              "on-click": "btop",
              "tooltip": false
            },
            "pulseaudio#audio": {
              "format": "{icon} {volume}%",
              "format-bluetooth": "󰂯{icon} {volume}%",
              "format-bluetooth-muted": "󰂯󰖁 {volume}%",
              "format-muted": "󰖁 {volume}%",
              "format-icons": {
                "headphone": "󰋋",
                "hands-free": "󰋋",
                "headset": "󰋋",
                "phone": "",
                "portable": "",
                "car": "",
                "default": [
                  "󰕿",
                  "󰖀",
                  "󰕾"
                ]
              },
              "on-click": "pamixer -t",
              "on-scroll-up": "pamixer -i 5",
              "on-scroll-down": "pamixer -d 5",
              "tooltip": true,
              "tooltip-format": "{icon} {desc}"
            },
            "pulseaudio#microphone": {
              "format": "{format_source}",
              "format-source": "󰍬 {volume}%",
              "format-source-muted": "󰍭 {volume}%",
              "on-scroll-up": "pamixer --default-source -i 5",
              "on-scroll-down": "pamixer --default-source -d 5",
              "max-volume": 100,
              "tooltip": false
            },
            "network#wlo1": {
              "interval": 1,
              "interface": "wlo1",
              "format-icons": [
                "󰤯",
                "󰤟",
                "󰤢",
                "󰤥",
                "󰤨"
              ],
              "format-wifi": "{icon}",
              "format-disconnected": "",
              "on-click": "nmtui",
              "tooltip": true,
              "tooltip-format": "󰢮 Wi-Fi\n󰩟 {ipaddr}/{cidr}\n{icon} {essid}\n󱑽 {signalStrength}% {signaldBm} dBm {frequency} MHz\n󰞒 {bandwidthDownBytes}\n󰞕 {bandwidthUpBytes}"
            },
            "network#enp42s0": {
              "interval": 1,
              "interface": "enp42s0",
              "format-icons": [
                "󰈁",
                "󰈂"
              ],
              "format-ethernet": "{icon}",
              "format-disconnected": "󰈂",
              "on-click": "nmtui",
              "tooltip": true,
              "tooltip-format": "󰢮 Ethernet\n󰩟 {ipaddr}/{cidr}\n󰞒 {bandwidthDownBytes}\n󰞕 {bandwidthUpBytes}"
            },
            "bluetooth": {
              "format-disabled": "",
              "format-off": "",
              "format-on": "󰂯",
              "format-connected": "󰂯",
              "format-connected-battery": "󰂯",
              "tooltip-format-connected": "{device_alias} 󰂄{device_battery_percentage}%",
              "on-click": "nmtui",
              "tooltip": true
            }
          }
        '';
      };

      ".config/waybar/kernel-widget-function.sh" = {
        text = ''
          #!/usr/bin/env bash

          neofetch
          echo "Press the ENTER key to start a shell."
          echo "To close this window, press CTRL + C or SUPER + Q."
          read
        '';
      };
    };
  };
}
