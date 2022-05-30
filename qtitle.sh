#!/bin/bash
set -e

# Variables
country=AU

# Options
aur_helper=true
install_ly=true
gen_xprofile=false

sudo timedatectl set-ntp true
sudo hwclock --systohc
sudo reflector -c $country -a 12 --sort rate --save /etc/pacman.d/mirrorlist --verbose

if [[ $aur_helper = true ]]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru/;makepkg -si --noconfirm;cd
fi

# Install packages core
sudo pacman -S xorg-server xfce-polkit nitrogen lxappearance thunar qtile picom neofetch

# install login manager
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter

# install useful apps
sudo pacman -S alacritty firefox archlinx-wallpapers htop
paru -S --noconfirm alacritty-themes timeshift timeshift-autosnap libreoffice-fresh numlockx unimatrix

# wallpapers
git clone --recursive https://github.com/bknightInfo/wallpapers ~/.local/share/wallpapers

# Dotfiles
git clone --recursive https://github.com/bknightInfo/dotfiles ~/.dotfiles

sudo systemctl enable lightdm

# .xprofile
if [[ $gen_xprofile = true ]]; then
cat > ~/.xprofile << EOF
nitrogen --restore
picom -f
numlockx &
EOF
fi
