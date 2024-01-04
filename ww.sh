#!/bin/bash

# Install swww
yay -S --noconfirm swww

# Create directories for wallpapers
mkdir -p $HOME/Wallpapers/Animated

# Start swww
swww init

# Run swww 
while true; do
    if swww query; then
        sleep 10
        continue
    fi

    # Path to images
    swww-daemon & sleep 0.1 & swww img $HOME/Wallpapers/Animated
done &

# Copy swww directory to .config
cp -r ./swww ~/.config


# Enable and start
systemctl --user enable mysee.service
systemctl --user start mysee.service
