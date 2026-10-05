{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
  };
}
