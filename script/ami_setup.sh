#!/bin/bash

# from http://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt

echo "==> updating database"

apt-get update

#echo "==> Deleting some unneeded things"
#apt-get remove --purge mysql-server mysql-client mysql-common landscape-client

echo "==> Installing updates"

export DEBIAN_FRONTEND=noninteractive 
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

reboot
sleep 60


