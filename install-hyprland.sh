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

# Install audio servers and dependencies
sudo pacman -S --noconfirm pipewire-alsa pipewire-jack pipewire-pulse wireplumber gstreamer

# Install multimedia codecs
sudo pacman -S --noconfirm gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg

# Install terminal emulator
sudo pacman -S --noconfirm kitty

# Install file manager and related tools
sudo pacman -S --noconfirm dolphin dolphin-plugins ark kio-admin polkit-kde-agent

# Install keyring manager
sudo pacman -S  --noconfirm gnome-keyring

# Install hyprland and related components
sudo pacman -S --noconfirm hyprland hyprlock hypridle hyprcursor hyprpaper hyprpicker waybar rofi-wayland

# Copy hyprland config file
mkdir -p "$HOME/.config/hypr"
cp hyprland/hyprland.conf "$HOME/.config/hypr"

# Install Qt wayland support
sudo pacman -S --noconfirm qt5-wayland qt6-wayland

# Install XDG portals and user directories integration
sudo pacman -S --noconfirm xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-user-dirs-gtk

# Install fonts
sudo pacman -S --noconfirmttf-font-awesome ttf-jetbrains-mono-nerd ttf-opensans noto-fonts ttf-droid ttf-roboto

# Install additional utilities
sudo pacman -S --noconfirm dunst cliphist mpv pavucontrol

# Install Apps
sudo pacman -S --noconfirm yay                      # yay
sudo pacman -S --noconfirm visual-studio-code-bin   # VSCode
sudo pacman -S --noconfirm google-chrome            # browser
sudo pacman -S --noconfirm neofetch

# Themes and icons
sudo pacman -S --noconfirm breeze breeze5 breeze-gtk papirus-icon-theme
sudo pacman -S --noconfirm nwg-look