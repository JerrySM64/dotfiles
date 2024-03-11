{ config, pkgs, ... }: {

  # Add your extra packages here. They can be space separated or one package per line.
  # If unsure, you can open up the package search by pressing SUPER + Shift + W and 
  # choosing "Unstable Packages" to open up the package search.
  environment.systemPackages = with pkgs; [
  #  Example:
  #  wget
    webcord
  ];
}
