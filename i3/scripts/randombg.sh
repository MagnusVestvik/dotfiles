#!/bin/bash

# Directory containing your background images
WALLPAPER_DIR="/home/magnus/backgrounds"
# Time interval in seconds (e.g., 3600 seconds = 1 hour)
INTERVAL=120

while true; do
    # Select a random file from the directory
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # Set the random wallpaper using feh
    feh --bg-fill "$RANDOM_WALLPAPER"

    # Wait for the specified interval
    sleep "$INTERVAL"
done

