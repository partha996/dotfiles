#!/bin/bash

# Get the title and remove " - YouTube Music"
title=$(playerctl metadata title 2>/dev/null | awk -F ' - YouTube Music' '{print $1}')

# Escape special characters for Waybar (e.g., replace & with &amp;)
title=${title//&/and}

# Read the last stored title
last_title=$(cat /tmp/last_title 2>/dev/null)

# If the title is empty or "YouTube Music", restore the last valid one
if [[ -z "$title" || "$title" == "YouTube Music" ]]; then
	title="$last_title"
else
	echo "$title" >/tmp/last_title # Store the new title
fi

if [[ "$(playerctl status)" == "Paused" ]]; then
	# Display frozen timestamp when paused
	timestamps=""
else

	# Get the current position and length, handling errors
	timestamps=$(awk '{
  pos = $1;              
  len = $2 / 1000000;            
  printf "(%d:%02d/%d:%02d)\n", pos / 60, pos % 60, len / 60, len % 60;
}' <(echo "$(playerctl position 2>/dev/null) $(playerctl metadata mpris:length 2>/dev/null)"))

fi
# Output the formatted string
echo "$title $timestamps"
