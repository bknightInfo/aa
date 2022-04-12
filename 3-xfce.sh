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

sudo pacman -S --noconfirm --needed xorg-server xorg-apps xorg-xinit xorg-twm 
sudo pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-settings

# install x essentials
sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit xorg-fonts-misc dbus xsel acpi xbindkeys

# install only selected xfce goodies
sudo pacman -S --noconfirm xfce4 xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-netload-plugin xfce4-mpc-plugin xfce4-datetime-plugin xfce4-cpufreq-plugin thunar-media-tags-plugin thunar-archive-plugin

# install windows manager
sudo pacman -S --noconfirm dunst arc-gtk-theme arc-icon-theme papirus-icon-theme

# install login manager
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

#Sound
sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pavucontrol
sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
sudo pacman -S --noconfirm --needed gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly gstreamer

# install font essantials
sudo pacman -S --noconfirm fontconfig freetype2

# Install fonts
sudo pacman -S ttf-dejavu ttf-liberation ttf-anonymous-pro terminus-font ttf-font-awesome
paru -S --noconfirm ttf-ms-fonts noto-fonts ttf-roboto ttf-inconsolata

# Install admin tools
paru -S --noconfirm pamac-aur

# Install audio
sudo pacman -S alsa-utils pulseaudio 

# install dev tools
sudo pacman -S --noconfirm  stow zsh zsh-completions fzf composer
paru -S --noconfirm  visual-studio-code-bin fnm-bin sublime-text-4

# install useful apps
sudo pacman -S --noconfirm mpv vlc unrar neofetch alacritty vlc
paru -S --noconfirm  alacritty-themes zramd timeshift timeshift-autosnap libreoffice-fresh brave-bin numlockx unimatrix

echo "change shell"
chsh --shell /bin/zsh bknight2k
curl -sS https://starship.rs/install.sh | sh

# wallpapers
git clone --recursive https://github.com/bknightInfo/wallpapers ~/.local/share/wallpapers

# Dotfiles
git clone --recursive https://github.com/bknightInfo/dotfiles ~/.dotfiles


sudo systemctl enable --now zramd
sudo systemctl enable lightdm
