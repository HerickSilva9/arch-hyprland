# Instalar o arch
loadkeys br-abnt2
archinstall

sudo pacman -Syu

sudo pacman -S pipewire-alsa pipewire-jack pipewire-pulse kitty  wireplumber gstreamer gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg --noconfirm

# Instalar yay
sudo pacman -S git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

#Instalar hyprland
sudo pacman -S hyprland hyprlock hypridle hyprcursor hyprpaper hyprpicker waybar bash rofi-wayland nautilus ark kio-admin polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst cliphist mpv pavucontrol xdg-user-dirs-gtk ttf-font-awesome ttf-jetbrains-mono-nerd ttf-opensans noto-fonts ttf-droid ttf-roboto gnome-keyring --noconfirm
