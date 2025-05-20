{ config, pkgs, ... }:

{
  programs = {
    fuzzel = {
      enable = true;
      package = pkgs.fuzzel;
      settings = {
        main = {
          font = "JetBrains Mono:size=14";
          dpi-aware = "auto";
          prompt = "> ";
          password-character = "*";
          show-actions = "no";
          terminal = "kitty";
          list-executables-in-path = "no";
          layer = "overlay";
          exit-on-keyboard-focus-loss = "no";

          icon-theme = "Papirus";
          icons-enabled = "yes";

          lines = "14";
          width = "30";
          tabs = "8";
          horizontal-pad = "40";
          vertical-pad = "8";
          inner-pad = "10";
        };

        border = {
          width = "3";
          radius = "8";
        };

        colors = {
          background = "100f0fff";
          border = "95e6cbff";
          input = "cecdc3ff";
          match = "24837bff";
          prompt = "cecdc3ff";
          selection-match = "a02f6fff";
          selection-text = "24837bff";
          selection = "100f0fff";
          text = "cecdc3ff";
        };
      };
    };
  };
}
