{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      dina-font
      fira-code
      fira-code-symbols
      jetbrains-mono
      liberation_ttf
      mplus-outline-fonts.githubRelease
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      proggyfonts
      vegur
    ];
  };
}
