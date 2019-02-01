
echo "==> Removing unnecessary files"

apt-get -y purge ppp pppconfig pppoeconf

# Clean up the apt cache
apt-get -y autoremove --purge
apt-get -y autoclean
apt-get -y clean

echo "==> Removing APT files"
find /var/lib/apt -type f | xargs rm -f
echo "==> Removing any docs"
rm -rf /usr/share/doc/*
echo "==> Removing caches"
find /var/cache -type f -exec rm -rf {} \;
echo "==> Cleaning up tmp"
rm -rf /tmp/*

echo "==> Clearing last login information etc"
>/var/log/lastlog
>/var/log/wtmp
>/var/log/btmp

unset HISTFILE
rm -f /root/.bash_history

# Clean up log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

#echo "==> Installed packages"
#dpkg -l

sync
