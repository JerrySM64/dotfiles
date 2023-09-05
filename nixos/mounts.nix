{ config, ... }:

{
  # Mount the GameDrive
  fileSystems."/home/Jerry/GameDrive" = {
    device = "/dev/disk/by-uuid/6ccc8824-1845-4990-ba1d-0da397021e37";
    fsType = "xfs";
    options = [ "nofail" ];
  };
}
