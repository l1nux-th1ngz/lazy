#!/bin/bash

switch_version() {
    get_theme
    get_ver

    # Define the directory where your layouts are stored
    layout_dir="$HOME/.config/waybar"

    # Get a list of all layouts in the directory
    layouts=($(ls $layout_dir))

    # Find the index of the current layout in the list
    for index in "${!layouts[@]}"; do
        if [[ "${layouts[$index]}" = "$VER" ]]; then
            current_index=$index
        fi
    done

    # Get the next layout in the list
    next_index=$((($current_index + 1) % ${#layouts[@]}))
    next_layout=${layouts[$next_index]}

    # Switch to the next layout
    VERTO="$next_layout-"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Switching to $next_layout"
}
