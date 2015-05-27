#!/bin/bash

#Sets useful default icons and turns off annoying screen locks

#dbus-session-run? Currently have to run this manually

export DISPLAY=:0
export GSETTINGS_BACKEND=dconf

# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

gsettings set com.canonical.Unity.Launcher favorites "['gnome-terminal.desktop', 'CodeBlocks.desktop','firefox.desktop', 'unity-control-center.desktop','nautilus.desktop']"

gsettings set org.gnome.desktop.session idle-delay 0

dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false
dconf write /org/gnome/desktop/screensaver/lock-enabled false