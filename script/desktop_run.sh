mkdir /home/ubuntu/.config
mkdir /home/ubuntu/.config/autostart

cat <<EOT > /home/ubuntu/.config/autostart/startup.desktop
[Desktop Entry]
Version=1.0
Name=StartScripts
Exec=sh -e /home/ubuntu/scripts/user_config.sh
Icon=system-run
Type=Application
Terminal=false
EOT

cat <<EOT > /home/ubuntu/.config/autostart/vagrant_terminal.desktop
[Desktop Entry]
Version=1.0
Name=Start terminal
Type=Application
Exec=gnome-terminal --working-directory=/vagrant/
Icon=system-run
EOT

chown -R ubuntu:ubuntu /home/ubuntu/

adduser ubuntu vboxsf

#turn off automatic updates
#cat <<EOT > /etc/apt/apt.conf.d/10periodic
#APT::Periodic::Update-Package-Lists "0";
#APT::Periodic::Download-Upgradeable-Packages "0";
#APT::Periodic::AutocleanInterval "0";
#EOT

#prevent problem with terminal not starting
locale-gen
localectl set-locale LANG="en_US.UTF-8"


