{ config, pkgs, ... }:

{
  users.users."jerry".packages = with pkgs; [
    ffmpeg-full
    kdePackages.kdenlive
  ];
}
