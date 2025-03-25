#!/bin/sh

# Get focused window geometry
WIN_GEOM=$(hyprctl activewindow -j | jq -r '"\(.at | join(",")) \(.size | join("x"))"')

# Define the file name with timestamp
FILE="$HOME/Pictures/screenshots/$(date +'%Y%m%d-%H%M%S').png"

# Take a screenshot of the focused window and open it in Swappy
if grim -g "$WIN_GEOM" "$FILE"; then
    swappy -f "$FILE"
    notify-send "Screenshot Saved!" "File: $FILE"
else
    notify-send "Screenshot Failed!" "An error occurred."
fi
