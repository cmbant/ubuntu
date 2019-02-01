#!/bin/bash

#Called when user starts desktop

#gsettings set com.canonical.Unity.Launcher favorites "['gnome-terminal.desktop', 'CodeBlocks.desktop','firefox.desktop', 'unity-control-center.desktop','nautilus.desktop']"

#gsettings set org.gnome.desktop.session idle-delay 0
#gsettings set com.ubuntu.update-notifier auto-launch false

dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false
dconf write /org/gnome/desktop/screensaver/lock-enabled false

#only want to run once, delete calling file
echo "X-GNOME-Autostart-enabled=false" >> /home/ubuntu/.config/autostart/startup.desktop

