# PLEASE READ THE WIKI FOR DETERMINING
# VALUES FOR THIS PAGE. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  username = "buber";
  userDescription = "Tomek Bobrowicz";
  hostname = "thinkpad";
  # This is for running NixOS
  # On a tmpfs or root on RAM 
  # Setting this to false is 
  # a must unless you already 
  # have an impermanent system!
  # TLDR; You Most Likely Want This -> false
  impermanence = false; 
  userHome = "/home/${username}";
  flakeDir = if impermanence == false then "${userHome}/easynix"
	     else "/nix/persist/etc/nixos/easynix";
in {
  # User Variables
  username = "${username}";
  userDescription = "${userDescription}";
  hostname = "${hostname}";
  gitUsername = "Tomek Bobrowicz";
  gitEmail = "bobrowicz.tomek@gmail.com";
  theme = "catppuccin-mocha";
  cursorTheme = "Simp1e-Tokyo-Night-Storm";
  slickbar = true;
  simplebar = false; # UNDER CONSTRUCTION. DO NOT ENABLE!
  borderAnim = true;
  browser = "google-chrome";
  wallpaperGit = "https://github.com/EasyNixProject/wallpapers"; # This will give you the EasyNix wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script) 
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  flakeDir = "${flakeDir}";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  terminal = "kitty";

  # System Settings
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "pl";
  theSecondKBDLayout = "us";
  theKBDVariant = "";
  theLCVariables = "pl_PL.UTF-8";
  theTimezone = "Europe/Warsaw";
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11 set here
  impermanence = if impermanence == true then true else false;

  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  # For VMs vm Should Be Used For gpuType
  cpuType = "intel";
  gpuType = "intel";

  # Bios Type 
  biosType = "uefi"; # Possible options: legacy, uefi
  # legacyGrubDevice = "/dev/sda";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  # intel-bus-id = "PCI:0:2:0";
  # nvidia-bus-id = "PCI:14:0:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # Enable /Setup Samba (SMB)
  smb = false;
  smbMountPoint = "/mnt/samba";
  smbDevice = "smb:/127.0.0.1/smb";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Printer & Scanner Support
  printer = true;

  # Enable Support For
  # Logitech Devices
  logitech = true;

  # Enable support for different file systems
  ntfs = true;

  # Add support for containers
  distrobox = true; # Setting this to true also enables Podman.
  flatpak = false;
  podman = false;

  # Text Editors
  emacs = false; # The config is still under construction. You will get vanilla GNU Emacs as of right now!
  nano = false;
  neovim = true;

  # Cloud-based - let's hope it's not raining, today!
  nextcloud = true;

  # Social Apps
  element = true;
  discord = true;
  telegram = true;

  # Enable Larger Programs
  ardour = true;
  blender = true;
  kdenlive = true;
  obs = true;
  steam = true;

  # Enable Terminals
  # If You Disable All You Get Kitty
  wezterm = false;
  alacritty = true;
  kitty = true;

  # Development
  adb = false;
  common = true;
  nix-prefetch-scripts = true;
  nodejs = false; nodejs-v = "21";
  python = true;

}
