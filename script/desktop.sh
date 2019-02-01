#!/bin/bash -eux

SSH_USER=${SSH_USERNAME:-vagrant}

echo "==> Getting updates"
apt-get -y update
apt-get -y upgrade

echo "==> Installing ubunutu-desktop"

apt-get install -y --no-install-recommends ubuntu-desktop gnome-terminal \
   firefox gedit gir1.2-gtksource-3.0 
 

#apt-get install -y ubuntu-desktop gedit libreoffice-gnome- libreoffice-core- gnome-sudoku- \
#  gnome-mahjongg- gnome-bluetooth- cups- speech-dispatcher- thunderbird- \
#  pulseaudio- rhythmbox- ubuntu-software- ubuntu-docs- ubuntu-web-launchers-

USERNAME=${SSH_USER}
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm3/custom.conf

if [ -f $GDM_CUSTOM_CONFIG ]; then
    mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
    > $GDM_CUSTOM_CONFIG
    echo "[daemon]" >> $GDM_CUSTOM_CONFIG
    echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLoginEnable = true" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLogin = ${USERNAME}" >> $GDM_CUSTOM_CONFIG
#    echo "InitialSetupEnable=false" >> $GDM_CUSTOM_CONFIG
fi

if [ -f $LIGHTDM_CONFIG ]; then
    echo "==> Configuring lightdm autologin"
    echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
    echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
    echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
fi

if [ -d /etc/xdg/autostart/ ]; then
    echo "==> Disabling screen blanking"
    NODPMS_CONFIG=/etc/xdg/autostart/nodpms.desktop
    echo "[Desktop Entry]" >> $NODPMS_CONFIG
    echo "Type=Application" >> $NODPMS_CONFIG
    echo "Exec=xset -dpms s off s noblank s 0 0 s noexpose" >> $NODPMS_CONFIG
    echo "Hidden=false" >> $NODPMS_CONFIG
    echo "NoDisplay=false" >> $NODPMS_CONFIG
    echo "X-GNOME-Autostart-enabled=true" >> $NODPMS_CONFIG
    echo "Name[en_US]=nodpms" >> $NODPMS_CONFIG
    echo "Name=nodpms" >> $NODPMS_CONFIG
    echo "Comment[en_US]=" >> $NODPMS_CONFIG
    echo "Comment=" >> $NODPMS_CONFIG
fi


echo "==> Disabling periodic apt upgrades"
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# Disable the release upgrader
echo "==> Disabling the release upgrader"
sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades

echo 'GRUB_RECORDFAIL_TIMEOUT=1' >> /etc/default/grub
sudo update-grub

echo "==> Disabling lock screen and upgrade notifications"
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
echo "export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/" >> /home/ubuntu/.bashrc
echo "gsettings set org.gnome.desktop.session idle-delay 0" >>  /home/ubuntu/.bashrc
echo "gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'"  >> /home/ubuntu/.bashrc
echo "gsettings set com.ubuntu.update-notifier no-show-notifications true"  >> /home/ubuntu/.bashrc
