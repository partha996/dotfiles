#!/bin/sh

# Define the file name
FILE="$HOME/Pictures/screenshots/$(date +'%H%M%S-Screenshot.png')"

# Take the screenshot with grim
if grim "$FILE" && swappy -f "$FILE"; then

	notify-send "Screenshot Saved:" "$FILE" 

else

	notify-send "Screenshot Failed!" "An error occurred."

fi
