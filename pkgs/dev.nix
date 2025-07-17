{ pkgs, ... }:

{
  imports = [
    ../nixos/users/dev.nix
  ];

  programs = {
    adb = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      cmake
      gh
      gitFull
      gnumake
      libtool
      nix-prefetch-scripts
      pkg-config
      python311Full
      rustup
    ];
  };
}
