#!/bin/bash

echo "==> updating startup message"

rm -f /etc/update-motd.d/00-starcluster
mv /tmp/motd.txt /etc/update-motd.d/00-starcluster
chmod +x /etc/update-motd.d/00-starcluster

echo "==> updating database"

apt-get update

echo "==> Installing updates"

export DEBIAN_FRONTEND=noninteractive
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

reboot
sleep 60


