{ config, ... }:

{
  imports = [
    ./shell/default.nix
  ];

  home = {
    file = {
      ".local/share/updates.sh" = {
        source = ../../files/update-scripts/hurricane/updates.sh;
      };
    };
  };
}
