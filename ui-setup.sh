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