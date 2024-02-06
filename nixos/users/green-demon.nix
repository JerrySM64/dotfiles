{ config, lib, pkgs, ... }:

{
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
}
