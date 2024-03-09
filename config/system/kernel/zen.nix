{ config, inputs, lib, pkgs, ... }:

let inherit (import ../../../options.nix) theKernel; in
lib.mkIf (theKernel == "zen") {
  boot.kernelPackages = inputs.nixpkgs-upstream.legacyPackages.x86_64-linux.linuxPackages_zen;
}
