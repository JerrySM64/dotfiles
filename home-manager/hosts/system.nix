{ config, pkgs, ... }:

{
  imports = [
    ../../obs.nix
  ];

  # System packages
  environment = {
    systemPackages = with pkgs; [
      distrobox
    ];
  };
}
