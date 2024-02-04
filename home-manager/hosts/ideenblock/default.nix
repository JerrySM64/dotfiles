{ config, ... }:

{
  imports = [
    ./shell/default.nix
  ];

  home = {
    file = {
      ".local/share/updates.sh" = {
        source = ../../files/update-scripts/ideenblock/updates.sh;
      };
    };
  };
}
