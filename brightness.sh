#!/bin/bash

# List brightnessctl devices
devices=$(brightnessctl --list | cut -d'(' -f2 | cut -d')' -f1)

echo "Devices that can be controlled by brightnessctl:"
echo $devices

# Set brightness for each device
for device in $devices
do
    echo "Setting brightness for $device"
    brightnessctl -d $device s 100%
done
