{ pkgs, config, gtkThemeFromScheme, ... }:

{
  # Configure Cursor Theme
  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Tokyo-Night-Storm";
    size = 24;
    gtk = {
      enable = true;
    };
    x11 = {
      enable = true;
      defaultCursor = "Simp1e-Tokyo-Night-Storm";
    };
  };

  # Theme GTK
  gtk = {
    enable = true;
    font = {
      name = "Ubuntu";
      size = 12;
      package = pkgs.ubuntu_font_family;
    };
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme {scheme = config.colorScheme;};
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };

  # Theme QT -> GTK
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
    };
  };
}
