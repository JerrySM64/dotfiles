{ config, lib, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      package = pkgs.alacritty;
      settings = {
        colors = {
          primary =  {
            background = "#15161F";
            foreground = "#dddddd";
          };

          normal = {
            black = "#000000";
            red = "#cc0403";
            green = "#19cb00";
            yellow = "#cecb00";
            blue = "#0f73cc";
            magenta = "#cb1ed1";
            cyan = "#0dcdcd";
            white = "#dddddd";
          };

          bright = {
            black = "#767676";
            red = "#f2201f";
            green = "23fd00";
            yellow = "#fffd00";
            blue = "#1a8fff";
            magenta = "#fd28ff";
            cyan = "#14ffff";
            white = "#ffffff";
          };

          title = "Terminal";

          dynamic_title = true;

          class = {
            instance = "Terminal";
            general = "Terminal";
          };
        };
      };
    };
  };
}
