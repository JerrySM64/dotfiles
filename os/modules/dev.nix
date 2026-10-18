{ config, pkgs, ... }:

{
  users.users."jerry".packages = with pkgs; [
    # C/C++ toolchain & build tools
    cmake
    gcc
    gnumake

    # Rust toolchain
    cargo
    clippy
    rustc
    rustfmt
    rust-analyzer

    # Pacman for devkitPro
    pacman
  ];
}
