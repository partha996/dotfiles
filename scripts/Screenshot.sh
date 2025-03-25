#!/bin/sh

# Define the file name
FILE="$HOME/Pictures/screenshots/$(date +'%H%M%S-Screenshot.png')"

# Take the screenshot with grim
if grim "$FILE" && swappy -f "$FILE"; then

	# Send a notification
	notify-send "Screenshot Saved:" "$FILE" 
else
	# Notify the user if the screenshot failed
	notify-send "Screenshot Failed!" "An error occurred."
fi
