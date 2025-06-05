{ pkgs, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
    };
    mime.enable = true;
    mimeApps.enable = true;
  };
}
