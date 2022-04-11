#!/bin/bash
USER=user
PASSWORD=password
ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
hwclock --systohc
sed -i '153s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_AU.UTF-8" >> /etc/locale.conf
echo "hydra" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 hydra.localdomain hydra" >> /etc/hosts
echo root:${PASSWORD} | chpasswd

pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils alsa-utils pulseaudio bash-completion openssh rsync reflector acpi acpi_call nss-mdns acpid os-prober ntfs-3g 

# pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux 
sed -i '63s/.//' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

useradd -m ${USER}
echo ${USER}:${PASSWORD}  | chpasswd
usermod -aG wheel ${USER}

echo "${USER} ALL=(ALL) ALL" >> /etc/sudoers.d/${USER}





