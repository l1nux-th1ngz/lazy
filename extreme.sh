#!/bin/bash

# Set governor for each CPU core
for ((i=0;i<$(nproc);i++)); do
    echo "Setting governor for CPU$i to performance"
    echo performance | sudo tee /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
done
