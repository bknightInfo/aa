#!/bin/bash

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.btrs -f /dev/nvme0n1p2

mount /dev/nvme0n1p3 /mnt

cd /mnt

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @var
btrfs subvolume create @data
btrfs subvolume create @srv

cd
umount /mnt

mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@ /dev/nvme0n1p3 /mnt
mkdir -p /mnt/{boot/efi,home,var,data,src}
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@home /dev/nvme0n1p3 /mnt/home
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@home /dev/nvme0n1p3 /mnt/var
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@data /dev/nvme0n1p3 /mnt/data
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@src /dev/nvme0n1p3 /mnt/srv

mount /dev/nvme0n1p1 /mnt/boot
pacstrap /mnt base btrfs-progs git amd-ucode linux linux-firmware nano vim

lsblk