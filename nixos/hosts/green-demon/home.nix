# Home Manager specific for Green Demon
{ pkgs, config, lib, ... }:

{
  imports = [
    ../../wm-config/awesomeconf.nix
    ../../wm-config/hyprconf.nix
    ../../wm-config/qtileconf.nix
  ];

  home = {
    packages = with pkgs; [
      dconf
      gnome.dconf-editor
    ];

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Catppuccin-Mocha";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    file = {
      # Update Script
      ".local/share/updates.sh" = {
        source = ../../../dots/update-scripts/NixOS/green-demon/updates.sh;
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        variant = "mocha";
        size = "compact";
      };
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
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

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
