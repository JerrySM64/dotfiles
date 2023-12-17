# Home Manager specific for Green Demon
{ pkgs, config, lib, isNixOS, ... }:

{
  home = {
    packages = with pkgs; [
      dconf
      gnome.dconf-editor
    ];

    pointerCursor = lib.mkIf isNixOS {
      package = pkgs.bibata-extra-cursors;
      name = "Bibata-Modern";
      size = 28;
      gtk.enable = true;
      x11.enable = true;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Nordic-dark";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk2configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}