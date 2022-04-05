#!/bin/bash
set -e

sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed git

echo
tput setaf 2
echo "################################################################"
echo "################### Software to install"
echo "################################################################"
tput sgr0
echo

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software for anything Arch based"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed arc-darkest-theme-git
sudo pacman -S --noconfirm --needed arcolinux-arc-themes-2021-sky-git
sudo pacman -S --noconfirm --needed arcolinux-candy-beauty-git
sudo pacman -S --noconfirm --needed arcolinux-fish-git
sudo pacman -S --noconfirm --needed ayu-theme
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed flameshot-git
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed spotify
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed surfn-icons-git

###############################################################################################

#nemesis-repo added to /etc/pacman.conf

if grep -q nemesis_repo /etc/pacman.conf; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### nemesis_repo is already in /etc/pacman.conf"
  echo "################################################################"
  tput sgr0
  echo  

else

echo '

[nemesis_repo]
SigLevel = Optional TrustedOnly
Server = https://erikdubois.github.io/$repo/$arch' | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Sy

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software from nemesis_repo"
echo "################################################################"
tput sgr0
echo  

sudo pacman -S --noconfirm --needed edu-candy-beauty-arc-git
sudo pacman -S --noconfirm --needed edu-candy-beauty-arc-mint-grey-git
sudo pacman -S --noconfirm --needed edu-candy-beauty-arc-mint-red-git
sudo pacman -S --noconfirm --needed edu-candy-beauty-tela-git
sudo pacman -S --noconfirm --needed edu-papirus-dark-tela-git
sudo pacman -S --noconfirm --needed edu-papirus-dark-tela-grey-git
sudo pacman -S --noconfirm --needed edu-vimix-dark-tela-git

###############################################################################################

# when on Leftwm

if [ -f /usr/share/xsessions/leftwm.desktop ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Leftwm related applications"
  echo "################################################################"
  tput sgr0
  echo


  sh ~/.config/leftwm/scripts/install-all-arcolinux-themes.sh
  sh ~/.config/leftwm/scripts/install-all-arcolinux-community-themes.sh
  
  leftwm-theme update
  leftwm-theme apply db-nemesis
fi

###############################################################################################

# when on Plasma

if [ -f /usr/bin/startplasma-x11 ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Plasma related applications"
  echo "################################################################"
  tput sgr0
  echo

  sudo pacman -S --noconfirm --needed arcolinux-plasma-nordic-darker-candy-git
  sudo pacman -S --noconfirm --needed arcolinux-plasma-arc-dark-candy-git
fi

###############################################################################################


# when on Arch Linux

if grep -q "Arch Linux" /etc/os-release; then
  echo
  tput setaf 2
  echo "################################################################"
  echo "############### Installing software for Arch Linux - Any desktop"
  echo "################################################################"
  tput sgr0
  echo
  sudo pacman -S --noconfirm --needed alacritty
  sudo pacman -S --noconfirm --needed arcolinux-alacritty-git
  sudo pacman -S --noconfirm --needed arcolinux-hblock-git
  sudo pacman -S --noconfirm --needed arcolinux-logout-git
  sudo pacman -S --noconfirm --needed arcolinux-paru-git
  sudo pacman -S --noconfirm --needed arcolinux-root-git
  sudo pacman -S --noconfirm --needed arcolinux-system-config-dev-git  
  sudo pacman -S --noconfirm --needed arcolinux-tweak-tool-git
  sudo pacman -S --noconfirm --needed arcolinux-variety-git
  sudo pacman -S --noconfirm --needed arcolinux-wallpapers-git
  sudo pacman -S --noconfirm --needed arcolinux-zsh-git
  sudo pacman -S --noconfirm --needed bat
  sudo pacman -S --noconfirm --needed dmenu
  sudo pacman -S --noconfirm --needed expac
  sudo pacman -S --noconfirm --needed feh
  sudo pacman -S --noconfirm --needed gvfs-smb
  sudo pacman -S --noconfirm --needed man-db
  sudo pacman -S --noconfirm --needed man-pages  
  sudo pacman -S --noconfirm --needed meld
  sudo pacman -S --noconfirm --needed neofetch
  sudo pacman -S --noconfirm --needed nss-mdns
  sudo pacman -S --noconfirm --needed paru-bin
  sudo pacman -S --noconfirm --needed ripgrep
  sudo pacman -S --noconfirm --needed variety

  sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
  sudo pacman -S --noconfirm --needed awesome-terminal-fonts
  sudo pacman -S --noconfirm --needed noto-fonts
  sudo pacman -S --noconfirm --needed ttf-bitstream-vera
  sudo pacman -S --noconfirm --needed ttf-dejavu
  sudo pacman -S --noconfirm --needed ttf-droid
  sudo pacman -S --noconfirm --needed ttf-hack
  sudo pacman -S --noconfirm --needed ttf-inconsolata
  sudo pacman -S --noconfirm --needed ttf-liberation
  sudo pacman -S --noconfirm --needed ttf-roboto
  sudo pacman -S --noconfirm --needed ttf-roboto-mono
  sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family

#xfce
  sudo pacman -S --noconfirm --needed arcolinux-local-xfce4-git
  sudo pacman -S --noconfirm --needed sardi-icons
  sudo pacman -S --noconfirm --needed arcolinux-xfce-git
  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
  sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf
