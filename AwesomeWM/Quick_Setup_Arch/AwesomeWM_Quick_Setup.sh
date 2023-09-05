#!/bin/bash

# IMPORTANT! This script expects AwesomeWM to be already installed! See the script's README for more information.

# Update the system
sudo pacman -Syyu

#Install Paru
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin/
makepkg -sci

#Install all needed packages
paru -S --needed archlinux-wallpaper zsh zsh-syntax-highlighting zsh-autosuggestions find-the-command thunar-archive-plugin tumbler thunar-volman ttf-jetbrains-mono-nerd thunar-media-tags-plugin xarchiver p7zip unrar zip rofi nordic-theme papirus-icon-theme lightdm lightdm-slick-greeter numlockx accountsservice picom thunar noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pfetch fastfetch lxappearance gvfs xdg-user-dirs vlc mousepad firefox flameshot dmidecode pavucontrol pa-applet-git

# Create all needed directories
mkdir -p ~/.config/awesome/scripts
mkdir -p ~/.config/xsettingsd

# Download all files
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/Quick_Setup_Arch/.zshrc 
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/rc.lua 
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/theme.lua 
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/scripts/autostart.sh 
git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome/
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/Quick_Setup_Arch/xsettingsd.conf
curl -O https://github.com/JerrySM64/dotfiles/-/raw/main/AwesomeWM/Quick_Setup_Arch/lightdm.conf

# Move the files to their appropriate locations
mv .zshrc ~
mv rc.lua ~/.config/awesome/rc.lua
mv theme.lua ~/.config/awesome/theme.lua
mv autostart.sh ~/.config/awesome/scripts/autostart.sh
mv xsettingsd.conf ~/.config/xsettingsd/xsettingsd.conf
sudo mv lightdm.conf /etc/lightdm/lightdm.conf

# Make the autostart shell script executable
chmod +x ~/.config/awesome/scripts/autostart.sh

# Enable LightDM
sudo systemctl enable lightdm

# Change the user's shell to zsh
sudo chsh -s /bin/zsh $USER

# Done
echo ""
echo ""
echo "Now all you have to do is to reboot. Enjoy!"
echo ""
echo ""
