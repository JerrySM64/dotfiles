{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  nativebuildInputs = [
    pkgs.gcc
    pkgs.python310
    pkgs.SDL2
    pkgs.glew
    pkgs.zlib
    pkgs.git
  ];
}
