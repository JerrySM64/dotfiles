{ config, pkgs, ... }: {

  config = {
    # Steam has it's issues
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    # Gaming-specific packages
    environment.systemPackages = with pkgs; [
      bottles
      dolphin-emu
      gamemode
      lutris
      mangohud
      retroarch
      superTuxKart
      winePackages.stableFull
    ];
  };
}
