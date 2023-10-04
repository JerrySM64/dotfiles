{
  config,
  pkgs,
  ...
}: {

  # Imports specific to aarch64-vm
  imports = [
    ../../gnome.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Hostname
  networking = {
    # Specify hostname
    hostName = "aarch64-vm";
  };

  # Environment related things specific to aarch64-vm
  environment = {
    
    # Environment variables
    sessionVariables = {
    };

    # Packages specific to aarch64-vm
    systemPackages = with pkgs; [
    ];
  };
}