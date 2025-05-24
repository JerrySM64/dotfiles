{ config, ... }:

{
  imports = [
    ./shell/default.nix
    ./wm/default.nix
    ./programs/default.nix
  ];
}
