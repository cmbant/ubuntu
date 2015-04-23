
echo "==> Current disk space.."
df -h

echo "==> Current drive info"

fdisk -l

echo "==> Setup ephemeral storage as swap"

#gcc build needs lots of memory, set up swap (otherwise use instance with 30G memory e.g. r3.xlarge)
umount /dev/xvdb || :
mkswap /dev/xvdb || :
swapon /dev/xvdb || :