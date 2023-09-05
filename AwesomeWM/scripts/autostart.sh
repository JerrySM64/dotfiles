#!/usr/bin/env zsh

pk_gnome() {
    if [ -f "/etc/os-release" ] && grep -qi "nixos" /etc/os-release; then
        /run/current-system/sw/etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop
    else
        /usr/libexec/polkit-gnome-autentication-agent-1 &
    fi
}   

xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output HDMI-A-0 --off --output HDMI-A-1 --mode 1920x1080 --pos 1920x0 --rotate normal
killall picom
picom &
killall nm-applet
nm-applet &
killall pa-applet
pa-applet &
killall flameshot
flameshot &
pk_gnome
