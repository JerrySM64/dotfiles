{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  home = {
    username = "jerry";
    homeDirectory = "/home/jerry";
    backupFileExtension = "bak";
    stateVersion = "26.11";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
