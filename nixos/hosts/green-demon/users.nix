{ config, ... }:

{
  config = {
    users = {
      users = {
        jerry = {
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
            "jerry"
          ];
        };
      };
    };
  };
}
