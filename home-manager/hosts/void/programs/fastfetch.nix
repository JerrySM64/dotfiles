{ config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "  ";
        color = {
          keys = "light-blue";
        };
      };

      modules = [
        {
          type = "title";
          key = " ";
          color = {
            user = "light_blue";
            at = "white";
            host = "magenta";
          };
        }
        "break"
        {
          type = "os";
          key = " ";
          format = "{pretty-name}";
        }
        {
          type = "kernel";
          key = " ";
          format = "{1} {2}";
        }
        {
          type = "uptime";
          key = " 󰅐";
        }
        {
          type = "command";
          key = " 󰔠";
          text = "hourglass";
        }
        "break"
        {
          type = "host";
          key = " 󰾰";
        }
        {
          type = "cpu";
          key = " 󰻠";
        }
        {
          type = "gpu";
          key = " 󰍛";
        }
        {
          type = "memory";
          key = " ";
        }
        {
          type = "disk";
          key = " ";
        }
        {
          type = "display";
          key = " 󰍹";
        }
        {
          type = "battery";
          key = " ";
        }
        {
          type = "gamepad";
          key = " 󰖺";
        }
        "break"
        {
          type = "de";
          key = " 󰕮";
        }
        {
          type = "wm";
          key = " ";
        }
        {
          type = "shell";
          key = " ";
        }
        {
          type = "terminal";
          key = " ";
        }
        {
          type = "packages";
          key = " 󰏖";
        }
        "break"
        {
          type = "colors";
          paddingLeft = "2";
          symbol = "circle";
        }
      ];
    };
  };
}
