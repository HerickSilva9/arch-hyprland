#!/bin/bash
sudo -v
while true; do sleep 60; sudo -v; done &
SUDO_PID=$!
trap 'kill $SUDO_PID; sudo -k' EXIT

# Update system packages
sudo pacman -Syu --noconfirm

# Import Chaotic-AUR GPG key
sudo pacman-key --recv-keys 3056513887B78AEB
sudo pacman-key --lsign-key 3056513887B78AEB

# Install Chaotic-AUR keyring and mirrorlist
sudo pacman -U --noconfirm \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Add Chaotic-AUR repository to pacman.conf if it doesn't exist yet
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | \
    sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm gnome-keyring libsecret

# Install Apps
sudo pacman -S --noconfirm visual-studio-code-bin   # VSCode
sudo pacman -S --noconfirm google-chrome            # browser
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm tree

# Fonts
sudo pacman -S --noconfirm ttf-roboto noto-fonts-emoji noto-fonts ttf-open-sans ttf-droid

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
sudo systemctl enable libvirtd.service

echo "Restart your pc to apply the changes."