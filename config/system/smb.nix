{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix)  smb smbMountPoint smbDevice;
    inherit (import ../../smb-secrets.nix) smbUsername smbPassword
					   smbEnableDomain smbDomain; in 
lib.mkIf (smb == true) {
  fileSystems."${smbMountPoint}" = {
    device = "${smbDevice}";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };
  environment = {
    etc."nixos/smb-secrets".text = ''
      username=${smbUsername}
      ${if smbEnableDomain == true then ''
	domain=${smbDomain}
      '' else ''
      ''}
      password=${smbPassword}
    '';
    systemPackages = [pkgs.cifs-utils];
  };
}
