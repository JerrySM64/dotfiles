{ config, ... }:

{
  imports = [
    # General modules
    ../../modules/nerd-fonts.nix
    ../../modules/udev-rules.nix
    ../../modules/wine.nix
    ../../modules/dev.nix
    ../../modules/local-ai.nix

    # Desktop Environments
    ../../modules/de/kde.nix

    # Window Managers
    # ../../modules/wm/hyprland.nix
    # ../../modules/wm/mango.nix

    # Greeters
    # ../../modules/greeter/ly.nix
    ../../modules/greeter/sddm.nix
  ];
}
