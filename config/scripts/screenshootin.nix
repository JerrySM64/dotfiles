{ pkgs }:

pkgs.writeShellScriptBin "screenshootin" ''
  hyprctl keyword animation "fadeOut,0,0,default"; grimblast copy area; hyprctl keyword animation "fadeOut,1,4,default"
''
