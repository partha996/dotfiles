#!/bin/sh

# Define the file path
FILE="$HOME/Pictures/screenshots/$(date +'%H%M%S-screenshot.png')"

# Take the screenshot of selected rigion
if grim -g "$(slurp)" "$FILE" && swappy -f "$FILE"; then

	# Send a notification
	notify-send "Screenshot Saved:" "$FILE"
else
	# Notify the user if the screenshot failed
	notify-send "Screenshot Failed!" "An error occurred."
fi
