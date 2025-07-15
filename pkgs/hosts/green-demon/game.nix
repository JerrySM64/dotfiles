{ config, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
  };

  programs = {
    steam = {
      enable = true;
      remotePlay = {
        openFirewall = true;
      };
      dedicatedServer = {
        openFirewall = true;
      };
      localNetworkGameTransfers = {
        openFirewall = true;
      };
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };
}
