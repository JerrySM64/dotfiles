# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{ config, pkgs, ... }:

{

  # Define the system packages here
  environment = {
    systemPackages = with pkgs; [
      brave
      btop
      discord
      eza
      kitty
      lm_sensors
      neofetch
      nextcloud-client
      nh
      ntfs3g
      pciutils
      pfetch
      tdesktop
      unzip
      vlc
      wget
    ];
  };

  # Custom packages
  pkgs = {
    # example = pkgs.callPackage ./example { };
  };
}
