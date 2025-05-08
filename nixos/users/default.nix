{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      jerry = {
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
