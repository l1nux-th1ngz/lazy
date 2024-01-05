#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install nala and tasksel
sudo apt-get install -y nala tasksel task-xfce-desktop

# Use nala to install various packages
nala install xfce feh kitty rofi picom thunar nitrogen vlc gdebi mpv mpd x11-xserver-utils unzip wget pulseaudio pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev synaptic curl -y

# Copy nala to .config
cp -r nala ~/.config

# Install more packages with nala
nala install neofetch psmisc mangohud vim papirus-icon-theme terminator mintstick fonts-noto-color-emoji -y
nala install apt-transport-https curl -y

# Add the Brave browser repository
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Update system packages
nala update

# Install Brave browser
nala install brave-browser -y

# Install Plymouth and firmware-linux
sudo apt-get install -y plymouth plymouth-themes firmware-linux

# Install xorg display server and related packages
sudo apt-get install -y xorg xbacklight xbindkeys xvkbd xinput

# Install build-essential
sudo apt-get install -y build-essential

# Install microcode for Intel
sudo apt-get install -y intel-microcode

# Install XFCE packages
sudo apt-get install -y xfce4 xfce4-goodies

# Install Firefox ESR
sudo apt-get install -y firefox-esr

# Install network file tools and system events
sudo apt-get install -y dialog mtools acpi acpid gvfs-backends

# Enable avahi-daemon and acpid
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Install sound packages
sudo apt-get install -y alsa-utils volumeicon-alsa

# Install neofetch and htop
sudo apt-get install -y neofetch htop

# Install exa
sudo apt-get install -y exa

# Install cups and bluez blueman
sudo apt-get install -y cups bluez blueman

# Enable bluetooth and cups
sudo systemctl enable bluetooth
sudo systemctl enable cups

# Install vim
sudo apt-get install -y vim

# Install fonts
sudo apt-get install -y fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus geany geany-plugins

# Clone and setup rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git && cd rofi && chmod +x setup.sh
git clone https://github.com/Dartegnian/rofi-metro ~/.config/rofi/rofi-metro && chmod +x charms.sh

# Install fonts
nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts

# Configure GRUB
sudo sed -i 's/GRUB_GFXMODE=.*/GRUB_GFXMODE=1920x1080x32/' /etc/default/grub
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub
sudo update-grub2

# Set Plymouth theme
plymouth-set-default-theme -l
echo "Please choose a Plymouth theme from the list above, then run the following command with your chosen theme:"
echo "sudo plymouth-set-default-theme -R THEME"

# Update and upgrade system packages
sudo apt-get update && sudo apt-get upgrade -y
