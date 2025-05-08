{ config, pkgs, ... }:

{
  imports = [
  ];

  # Enable Programs
  programs = {
    git = {
      enable = true;
    };
  };

  # System packages
  environment = {
    systemPackages = with pkgs; [
      fastfetch
      gh
    ];
  };
}