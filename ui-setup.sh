#!/bin/bash

# Fonts
sudo pacman -S --noconfirm ttf-roboto noto-fonts-emoji noto-fonts ttf-open-sans ttf-droid ttf-jetbrains-mono-nerd ttf-ubuntu-font-family otf-font-awesome

# Waybar
sudo pacman -S --noconfirm waybar
sudo gpasswd -a $USER input && newgrp input
sudo pacman -S --noconfirm power-profiles-daemon

# Wallpaper
pushd /usr/share
git clone https://github.com/dracula/wallpaper.git
popd
sudo pacman -S --noconfirm swaybg

# gtk - Dracula
sudo pacman -S --noconfirm lxappearance gtk-engine-murrine gnome-themes-extra
git clone https://github.com/dracula/gtk.
mkdir -p .themes
mv gtk/ Dracula/
mv Dracula/ .themes/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"

# QT
sudo pacman -S --noconfirm kvantum kvantum-qt5
sudo pacman -S --noconfirm qt5ct qt6ct