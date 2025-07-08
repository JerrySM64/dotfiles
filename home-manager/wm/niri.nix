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
    ];

    file = {
      ".config/niri" = {
        source = ./niri;
        recursive = true;
      };
    };
  };
}
