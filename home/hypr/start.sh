#!/usr/bin/env bash

# initializing idle
hypridle &

# initializing wallpaper
hyprpaper &

# NetworkManagerApplet
nm-applet --indicator &

# Taskbar
waybar &

# dunst

# clipboard
# wl-clipboard-history -t &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
rm "$HOME/.cache/cliphist/db" & # Delete history at reboot

# vpn
expressvpn connect &
