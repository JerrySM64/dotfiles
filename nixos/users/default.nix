{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      Jerry = {
        isNormalUser = true;
        description = "Jerry";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
        openssh = {
          authorizedKeys = {
            keys = [
            ];
          };
        };
      };
    };
  };
}
