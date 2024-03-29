{ pkgs, config, username, ... }:

let
  inherit (import ../../options.nix)
    browser wallpaperDir wallpaperGit flakeDir;
in
{
  # Install Packages For The User
  home.packages = with pkgs; [
    pkgs."${browser}"
    libvirt
    swww
    grimblast
    slurp
    gnome.file-roller
    swaynotificationcenter
    rofi-wayland
    imv
    transmission-gtk
    mpv
    gimp
    rustup
    audacity
    pavucontrol
    font-awesome
    spotify
    swayidle
    neovide
    swaylock
    tree
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # Import Scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix {
      inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit;
    })
    (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ./../scripts/web-search.nix { inherit pkgs; })
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
  ];

  programs.gh.enable = true;
}
