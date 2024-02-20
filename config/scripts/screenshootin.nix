{ pkgs }:

pkgs.writeShellScriptBin "screenshootin" ''
  hyprctl keyword animation "fadeOut,0,0,default"; grimblast copysave area; hyprctl keyword animation "fadeOut,1,4,default"
''
