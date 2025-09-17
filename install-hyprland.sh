#!/bin/bash
set -e

sudo -v
while true; do sleep 60; sudo -v; done &
SUDO_PID=$!
trap 'kill $SUDO_PID; sudo -k' EXIT

# chaotic-aur setup
bash ./chaotic-setup.sh

# keyring
sudo pacman -S --noconfirm gnome-keyring libsecret

# Install Apps
sudo pacman -S --noconfirm visual-studio-code-bin   # VSCode
sudo pacman -S --noconfirm google-chrome            # browser
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm tree

# Fonts
sudo pacman -S --noconfirm ttf-roboto noto-fonts-emoji noto-fonts ttf-open-sans ttf-droid ttf-jetbrains-mono-nerd ttf-ubuntu-font-family

# Waybar
sudo pacman -S --noconfirm waybar
sudo pacman -S --noconfirm otf-font-awesome
sudo gpasswd -a $USER input && newgrp input
sudo pacman -S --noconfirm power-profiles-daemon

# Install docker
sudo pacman -S --noconfirm docker docker-compose
sudo systemctl disable docker.service
sudo systemctl enable docker.socket

# Install virt-manager
sudo pacman -S --noconfirm virt-manager qemu-desktop libvirt edk2-ovmf vde2 bridge-utils openbsd-netcat dnsmasq dmidecode
sudo systemctl enable --now libvirtd.service

sudo systemctl enable --now wpa_supplicant@wlan0.service

# Wallpaper
pushd /usr/share
git clone https://github.com/dracula/wallpaper.git
popd
sudo pacman -S --noconfirm swaybg

echo "Restart your pc to apply the changes."
