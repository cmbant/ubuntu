echo "==> Making swap file"

fallocate -l 2G /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile  swap      swap    defaults         0 0" >> /etc/fstab