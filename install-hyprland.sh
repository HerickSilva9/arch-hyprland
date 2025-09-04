#!/bin/bash
sudo -v
while true; do sleep 60; sudo -v; done &
SUDO_PID=$!
trap 'kill $SUDO_PID; sudo -k' EXIT

# Update system packages
sudo pacman -Syu

# Install audio servers and dependencies
sudo pacman -S pipewire-alsa pipewire-jack pipewire-pulse wireplumber gstreamer --noconfirm

# Install multimedia codecs
sudo pacman -S gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg --noconfirm

# Install terminal emulator
sudo pacman -S kitty --noconfirm

# Install file manager and related tools
sudo pacman -S dolphin dolphin-plugins ark kio-admin polkit-kde-agent --noconfirm

# Install keyring manager
sudo pacman -S gnome-keyring --noconfirm

# Install yay
pushd "$HOME"
sudo pacman -S --needed base-devel git go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd "$HOME"
rm -rf yay/
popd

# Install hyprland and related components
sudo pacman -S hyprland hyprlock hypridle hyprcursor hyprpaper hyprpicker waybar rofi-wayland --noconfirm

# Copy hyprland config file
mkdir -p "$HOME/.config/hypr"
cp hyprland.conf "$HOME/.config/hypr"

# Install Qt wayland support
sudo pacman -S qt5-wayland qt6-wayland --noconfirm

# Install XDG portals and user directories integration
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-user-dirs-gtk --noconfirm

# Install fonts
sudo pacman -S ttf-font-awesome ttf-jetbrains-mono-nerd ttf-opensans noto-fonts ttf-droid ttf-roboto --noconfirm

# Install additional utilities
sudo pacman -S dunst cliphist mpv pavucontrol --noconfirm

# Install Apps
yay -S google-chrome --noconfirm  # browser
sudo pacman -S code --noconfirm   # VSCode