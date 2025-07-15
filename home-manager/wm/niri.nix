{ pkgs, ... }: 

{
  home = {
    packages = with pkgs; [
      kitty
      niri
      polkit_gnome
      swaybg
      swayidle
      xwayland-satellite
      xdg-desktop-portal-gnome
    ];

    file = {
      ".config/niri" = {
        source = ./niri;
        recursive = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
    configPackages = [pkgs.xdg-desktop-portal-gnome];
  };
}
