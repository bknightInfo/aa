#!/bin/bash

BOOT=nvme0n1p1
SWAP=nvme0n1p2
DRIVE=nvme0n1p3

mkfs.fat -F32 /dev/${BOOT}
mkswap /dev/${SWAP}
swapon /dev/${SWAP}
mkfs.btrfs -f /dev/${DRIVE}

mount /dev/${DRIVE} /mnt

cd /mnt

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @var
btrfs subvolume create @opt
btrfs subvolume create @tmp
btrfs subvolume create @srv

cd
umount /mnt

mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@ /dev/${DRIVE} /mnt
mkdir -p /mnt/{boot,home,var,opt,tmp,srv}
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@home /dev/${DRIVE} /mnt/home
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@opt /dev/${DRIVE} /mnt/opt
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@tmp /dev/${DRIVE} /mnt/tmp
mount -o noatime,compress=zstd,ssd,discard=async,space_cache=v2,subvol=@srv /dev/${DRIVE} /mnt/srv
mount -o subvol=@var /dev/${DRIVE} /mnt/var
mount /dev/${BOOT} /mnt/boot
pacstrap /mnt base btrfs-progs git amd-ucode linux linux-firmware nano vim
genfstab -U /mnt >> /mnt/etc/fstab
cd ..
cp -r /aa /mnt
arch-chroot /mnt
