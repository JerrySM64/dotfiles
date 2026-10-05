{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  home = {
    username = "jerry";
    homeDirectory = "/home/jerry";
    backupFileExtension = "bak";
    packages = with pkgs; [
      bat
    ];

    stateVersion = "26.11";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
