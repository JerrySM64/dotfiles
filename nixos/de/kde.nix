{ pkgs, ... }:

{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings.General.DisplayServer = "wayland";
    };

    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gtk3 
    gtk_engines 
    gtk-engine-murrine 
    imagemagick 
    kdePackages.kde-gtk-config 
    kdePackages.plasma-browser-integration
    kdePackages.qtstyleplugin-kvantum 
    kdePackages.yakuake 
    nerd-fonts.fira-code 
    nerd-fonts.hack 
    nerd-fonts.meslo-lg 
    noto-fonts-color-emoji 
  ];
}
