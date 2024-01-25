{ config, ... }:

{
  config = {
    users = {
      users = {
        Jerry = {
          extraGroups = [
            "libvirt"
            "kvm"
          ];
        };
      };

      groups = {
        libvirtd = {
          members = [
            "root"
            "Jerry"
          ];
        };
      };
    };
  };
}
