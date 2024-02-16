# PLEASE READ THE WIKI FOR DETERMINING
# VALUES FOR THIS PAGE. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  username = "jerry";
  userDescription = "Jerry";
  hostname = "Green-Demon";
  # This is for running NixOS
  # On a tmpfs or root on RAM
  # You Most Likely Want This -> false
  impermanence = false; 
  userHome = "/home/${username}";
  flakeDir = if impermanence == false then "${userHome}/easynix"
	     else "/nix/persist/etc/nixos/easynix";
in {
  # User Variables
  username = "${username}";
  userDescription = "${userDescription}"
  hostname = "${hostname}";
  gitUsername = "JerrySM64";
  gitEmail = "42114389+JerrySM64@users.no-reply.github.com";
  theme = "ayu-dark";
  cursorTheme = "Simp1e-Tokyo-Night-Storm";
  slickbar = true;
  simplebar = false; # UNDER CONSTRUCTION. DO NOT ENABLE!
  borderAnim = true;
  browser = "brave";
  wallpaperGit = "https://gitlab.com/Zaney/my-wallpapers.git"; # This will give you my wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script) 
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  flakeDir = "${flakeDir}";
  terminal = "kitty";

  # System Settings
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "de";
  theSecondKBDLayout = "us";
  theKBDVariant = "";
  theLCVariables = "de_DE.UTF-8";
  theTimezone = "Europe/Berlin";
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  impermanence = false; # This should be set to false unless you know what you're doing!
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11 set here

  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  # For VMs vm Should Be Used For gpuType
  cpuType = "amd";
  gpuType = "amd";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  # intel-bus-id = "PCI:0:2:0";
  # nvidia-bus-id = "PCI:14:0:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Printer & Scanner Support
  printer = false;

  # Enable Support For
  # Logitech Devices
  logitech = true;

  # Enable support for different file systems
  ntfs = true;

  # Add support for containers
  distrobox = false; # Setting this to true also enables Podman.
  flatpak = false;
  podman = false;

  # Text Editors
  emacs = false; # The config is still under construction. You will get vanilla GNU Emacs as of right now!
  nano = false;
  neovim = true;

  # Cloud-based - let's hope it's not raining, today!
  nextcloud = true;

  # Enable Larger Programs
  ardour = true;
  blender = true;
  kdenlive = true;
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
