{ config, ... }:

{
  config = {
    users = {
      users = {
        jerry = {
          extraGroups = [
            "libvirt"
            "libvirtd"
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
