mkdir /home/ubuntu/.config
mkdir /home/ubuntu/.config/autostart

sudo apt-get install -y --no-install-recommends gnome-panel

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

#prevent problem with terminal not starting
locale-gen
localectl set-locale LANG="en_US.UTF-8"


