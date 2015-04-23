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