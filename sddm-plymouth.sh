#!/bin/bash

# Update system packages
sudo pacman -Syu

# Install sddm and plymouth
sudo pacman -S sddm plymouth

# Enable sddm and plymouth
sudo systemctl enable sddm
sudo systemctl enable plymouth

# Clone the Anime-sddm-theme repository
git clone https://github.com/shinas101/Anime-sddm-theme.git

# Change to the Anime-sddm-theme directory
cd Anime-sddm-theme

# Make the install script executable
chmod +x ./install.sh

# Run the install script
sudo ./install.sh
