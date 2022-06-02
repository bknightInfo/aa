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
sudo pacman -Syu

if [[ $aur_helper = true ]]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru/;makepkg -si --noconfirm;cd
fi


# install x essentials
sudo pacman -S --noconfirm --needed xorg-server 
sudo pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-settings

# install only selected xfce goodies
sudo pacman -S --noconfirm xfce4 xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-mpc-plugin xfce4-datetime-plugin thunar-archive-plugin

# install windows manager
sudo pacman -S --noconfirm arc-gtk-theme arc-icon-theme papirus-icon-theme

# install login manager
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter

# Install fonts
sudo pacman -S ttf-dejavu ttf-liberation ttf-anonymous-pro terminus-font ttf-font-awesome
paru -S --noconfirm ttf-ms-fonts noto-fonts ttf-roboto ttf-inconsolata


# install dev tools
sudo pacman -S --noconfirm stow zsh zsh-completions 
paru -S --noconfirm visual-studio-code-bin 
# fnm-bin fzf composer

# install useful apps
sudo pacman -S --noconfirm vlc unrar neofetch htop alacritty firefox
paru -S --noconfirm  alacritty-themes timeshift timeshift-autosnap libreoffice-fresh numlockx unimatrix

# wallpapers
git clone --recursive https://github.com/bknightInfo/wallpapers ~/.local/share/wallpapers

# Dotfiles
git clone --recursive https://github.com/bknightInfo/dotfiles ~/.dotfiles

sudo systemctl enable lightdm
