{ config, ... }:

{
  users = {
    users = {
      Jerry = {
        extraGroups = [
          "adbusers"
        ];
      };
    };
  };
}
