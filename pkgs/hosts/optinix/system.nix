{ config, pkgs, ... }:

{
  imports = [
  ];

  # Enable Programs
  programs = {
    git = {
      enable = true;
    };

    gh = {
      enable = true;
    };

    fastfetch = {
      enable = true;
    };
  };

  # System packages
  environment = {
    systemPackages = with pkgs; [
      
    ];
  };
}