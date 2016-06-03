#!/bin/bash

SSH_USER=${SSH_USERNAME:-vagrant}

echo "==> Getting updates"

apt-get -y update
apt-get -y upgrade

echo "==> Installing ubunutu-desktop"
apt-get install -y --no-install-recommends ubuntu-desktop gnome-terminal \
   firefox unity-lens-applications gedit gir1.2-gtksource-3.0 xterm

#try this?
apt-get install -y ubuntu-desktop

USERNAME=${SSH_USER}
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=${USERNAME}" >> $GDM_CUSTOM_CONFIG

echo "==> Configuring lightdm autologin"
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
