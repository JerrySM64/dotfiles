#!/bin/sh
# Notifications
dunst & disown
feh --bg-scale /home/Jerry/Downloads/wallpapers-master/0305.jpg
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed


# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown
flameshot & disown 
/run/current-system/sw/etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop & disown # start polkit agent from GNOME
