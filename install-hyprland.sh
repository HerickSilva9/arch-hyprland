#!/bin/bash
set -e

sudo -v
while true; do sleep 60; sudo -v; done &
SUDO_PID=$!
trap 'kill $SUDO_PID; sudo -k' EXIT

bash ./chaotic-setup.sh
bash ./system-setup.sh
bash ./ui-setup.sh

# Install Apps
sudo pacman -S --noconfirm visual-studio-code-bin   # VSCode
sudo pacman -S --noconfirm google-chrome            # browser

# Install docker
sudo pacman -S --noconfirm docker docker-compose
sudo systemctl disable docker.service
sudo systemctl enable docker.socket
sudo groupadd docker &&  sudo usermod -aG docker $USER

# Install virt-manager
sudo pacman -S --noconfirm virt-manager qemu-desktop libvirt edk2-ovmf vde2 bridge-utils openbsd-netcat dnsmasq dmidecode
sudo systemctl enable --now libvirtd.service

# utils
sudo pacman -S --noconfirm neofetch tree unzip zip archiso
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Restart your pc to apply the changes."
