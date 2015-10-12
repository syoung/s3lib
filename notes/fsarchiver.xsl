apps.fsarchiver

<entry [Fri 2011:03:25 13:11:27 EST] BASIC COMMANDS>

ARCHIVE /dev/sda1 USING 3 PROCESSORS

fsarchiver -j3 -o savefs /mnt/backup/gentoo-rootfs.fsa /dev/sda1


mkdir /mnt/dat
mkdir /mnt/os
mount -o ro,user_xattr,acl /dev/sda1 /mnt/os
mount -o rw /dev/sda3 /mnt/data
time fsarchiver savefs /mnt/data/ubuntu.110326.fsa /dev/sda1


</entry>