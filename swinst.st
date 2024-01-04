#!/bin/bash

# Install swww
yay -S --noconfirm swww

# Copy swww directory to .config
cp -r ./swww ~/.config
