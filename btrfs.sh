#!/bin/bash

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.btrs -f /dev/nvme0n1p2

mount /dev/nvme0n1p3 /mnt

cd /mnt

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @var
btrfs subvolume create @opt
btrfs subvolume create @tmp
btrfs subvolume create @srv

cd
umount /mnt

mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@ /dev/nvme0n1p3 /mnt
mkdir -p /mnt/{boot,home,var,opt,tmp,src}
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@home /dev/nvme0n1p3 /mnt/home
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@opt /dev/nvme0n1p3 /mnt/opt
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@tmp /dev/nvme0n1p3 /mnt/tmp
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@src /dev/nvme0n1p3 /mnt/srv
mount -o subvol=@home /dev/nvme0n1p3 /mnt/var
mount /dev/nvme0n1p1 /mnt/boot
pacstrap /mnt base btrfs-progs git amd-ucode linux linux-firmware nano vim

lsblk
