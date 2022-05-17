#!/bin/bash
set -e

git clone https://aur.archlinux.org/paru-bin
cd paru-bin/
makepkg -si --noconfirm
cd
rm -rf paru-bin

sudo pacman -S --noconfirm --needed reflector
sudo reflector -c AU -a 12 --sort rate --save /etc/pacman.d/mirrorlist --verbose
sudo pacman -Syu

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

# Install admin tools
paru -S --noconfirm pamac-aur

# install dev tools
sudo pacman -S --noconfirm stow zsh zsh-completions 
paru -S --noconfirm visual-studio-code-bin 
# fnm-bin fzf composer

# install useful apps
sudo pacman -S --noconfirm vlc unrar neofetch htop alacritty firefox
paru -S --noconfirm  alacritty-themes timeshift timeshift-autosnap libreoffice-fresh numlockx unimatrix

#echo "change shell"
#chsh --shell /bin/zsh bknight2k
#curl -sS https://starship.rs/install.sh | sh

# wallpapers
git clone --recursive https://github.com/bknightInfo/wallpapers ~/.local/share/wallpapers

# Dotfiles
git clone --recursive https://github.com/bknightInfo/dotfiles ~/.dotfiles

sudo systemctl enable lightdm
