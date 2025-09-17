#!/bin/bash

# keyring
sudo pacman -S --noconfirm gnome-keyring libsecret

# wpa_supplicant
sudo systemctl enable --now wpa_supplicant@wlan0.service