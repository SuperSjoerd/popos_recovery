#!/bin/bash
sudo cryptsetup luksOpen /dev/nvme0n1p3 cryptdata	
sudo lvscan
sudo vgchange -ay
sudo mount /dev/mapper/data-root /mnt
sudo mount /dev/nvme0n1p1 /mnt/boot/efi	

for i in dev dev/pts proc sys run; do sudo mount -B /$i /mnt/$i; done
sudo cp -n /etc/resolv.conf /mnt/etc/
sudo chroot /mnt
