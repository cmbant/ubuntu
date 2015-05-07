#!/bin/bash

#dbus-session-run?

gsettings set com.canonical.Unity.Launcher favorites "['gnome-terminal.desktop', 'CodeBlocks.desktop','firefox.desktop', 'unity-control-center.desktop','nautilus.desktop']"

gsettings set org.gnome.desktop.session idle-delay 0

dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false
dconf write /org/gnome/desktop/screensaver/lock-enabled false