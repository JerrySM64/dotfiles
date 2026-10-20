{ config, pkgs, ... }:

{
  users.users."jerry".packages = with pkgs; [
    # C/C++ toolchain & build tools
    cmake
    file
    gcc
    gnumake

    # Java toolchain
    jdk25

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
