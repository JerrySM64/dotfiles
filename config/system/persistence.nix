{ config, pkgs, lib, username, ... }:

let
  inherit (import ../../options.nix) impermanence;
in lib.mkIf (impermanence == true) {
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/libvirt"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      # "/etc/machine-id"
    ];
    users.${username} = {
      directories = [
	"Development"
	"Downloads"
	"Music"
	"Documents"
	"Pictures"
	"Videos"
	".cache"
	".cache/spotify"
	".config/BraveSoftware"
	".config/discord"
	".config/gh"
	".config/git"
	".config/pulse/"
	".config/Thunar"
	".local/share/sddm"
	".local/share/Steam"
	".local/state/wireplumber"
	".ssh"
	".steam"
      ];
      files = [
	".zsh_history"
	".config/gtk-3.0/bookmarks"
      ];
    };
  };
}
