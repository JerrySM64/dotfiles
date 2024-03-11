{ inputs
, config
, pkgs
, username
, hostname
, userDescription
, ...
}:

let
  inherit (import ./options.nix)
    theLocale theTimezone
    flakeDir userDescription theShell
    impermanence wallpaperDir wallpaperGit
    theLCVariables theKBDLayout theme;
in
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ./hardware.nix
    ./config/system
  ];

  colorScheme = inputs.nix-colors.colorSchemes.${theme};

  # Enable networking
  networking.hostName = "${hostname}"; # Define your hostname
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "${theTimezone}";

  # Select internationalisation properties
  i18n.defaultLocale = "${theLocale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${theLCVariables}";
    LC_IDENTIFICATION = "${theLCVariables}";
    LC_MEASUREMENT = "${theLCVariables}";
    LC_MONETARY = "${theLCVariables}";
    LC_NAME = "${theLCVariables}";
    LC_NUMERIC = "${theLCVariables}";
    LC_PAPER = "${theLCVariables}";
    LC_TELEPHONE = "${theLCVariables}";
    LC_TIME = "${theLCVariables}";
  };

  console.keyMap = "${theKBDLayout}";

  # Define a user account.
  users = {
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      hashedPassword = "$6$TIzjLu.7bL9up7Uh$D0xh.dRIGwniTi.DYTtUwep9yKXNteJmq6TNPa7c.skZzvKyb9XIYuloIlZ8/7tCZv3THSfehY2SNnDQb72oX0";
      isNormalUser = true;
      description = "${userDescription}";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      shell = pkgs.${theShell};
      ignoreShellProgramCheck = true;
      packages = with pkgs; [ ];
    };
  };

  environment.variables = {
    ENVER = "unstable";
    FLAKE = "${flakeDir}";
    PERSIST =
      if impermanence == true then
        ''/nix/persist/''
      else
        '''';
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  # Optimization settings and garbage collection automation
  nix = {
    package = pkgs.nixUnstable;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "23.11";
}
