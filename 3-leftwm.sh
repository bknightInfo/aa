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

sudo pacman -S --noconfirm --needed xorg-server xorg-apps xorg-xinit 
sudo pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-settings

# install x essentials
sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit xorg-fonts-misc dbus xsel acpi xbindkeys

#leftwm
paru -S --noconfirm --needed leftwm-git leftwm-theme-git polybar
paru -S --noconfirm --needed lsxhkd autorandr nerd-fonts-source-code-pro lolcat ttf-meslo-nerd-font-powerlevel10k ttf-material-design-iconic-font ttf-iosevka-nerd rofi-theme-fonts

#xfce stuff
sudo pacman -S --noconfirm --needed thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin exo
sudo pacman -S --noconfirm --needed tumbler xfce4-appfinder xfce4-panel xfce4-power-manager xfce4-settings xfconf xfwm4 xfce4-notifyd xfce4-screenshooter xfce4-taskmanager

sudo pacman -S --noconfirm --needed lxappearance volumeicon picom accountsservice 

# install windows manager
sudo pacman -S --noconfirm dunst arc-gtk-theme arc-icon-theme papirus-icon-theme

# install login manager
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

###cursors
paru -S --noconfirm bibata-cursor-theme-bin

###fonts
paru -S --noconfirm ttf-font-awesome

###icons
paru -S --noconfirm sardi-icons surfn-icons-git

###utilities-repo
paru -S --noconfirm alacritty alacritty-themes appstream archiso conky-lua-archers downgrade grub-customizer hardcode-fixer-git inxi mintstick-git neofetch python-pyparted python-pywal rate-mirrors-bin the_silver_searcher yad

###utilities
sudo pacman -S --noconfirm dpolkit polkit-gnome qt5ct qt5-webkit ripgrep rofi duf-bin htop hw-probe dconf-editor bat arandr file-roller p7zip unace unrar unzip

# install windows manager
sudo pacman -S --noconfirm dunst arc-gtk-theme arc-icon-theme papirus-icon-theme jq arc-gtk-theme arc-darkest-theme-git kvantum-qt5

# install login manager
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

#Sound
sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pavucontrol
sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
sudo pacman -S --noconfirm --needed gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly gstreamer


# Install audio
sudo pacman -S alsa-utils pulseaudio 

# install dev tools
sudo pacman -S --noconfirm  stow zsh zsh-completions zsh-syntax-highlighting fzf composer
paru -S --noconfirm  visual-studio-code-bin fnm-bin sublime-text-4 dmenu feh firefox numlockx scrot variety zramd timeshift timeshift-autosnap brave-bin unimatrix

paru -S --noconfirm  adobe-source-sans-fonts awesome-terminal-fonts noto-fonts ttf-dejavu ttf-droid ttf-hack ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family


cd

# wallpapers
git clone --recursive https://github.com/bknightInfo/wallpapers ~/.local/share/wallpapers

# Dotfiles
git clone --recursive https://github.com/bknightInfo/dotfiles ~/.dotfiles
cd ~/.dotfiles

stow alacritty
stow autostart
stow leftwm
stow sxhkd
stow thunar
stow variety
stow vscode
stow zsh

echo "change shell"
chsh --shell /bin/zsh bknight2k
curl -sS https://starship.rs/install.sh | sh


sudo systemctl enable --now zramd
sudo systemctl enable lightdm

#arco stuff to get later after nemesis
#ufetch-arco-git
#arcolinux-wallpapers-candy-git
#arcolinux-leftwm-git
#arcolinux-xfce-git
#arcolinux-pamac-all








