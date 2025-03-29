#!/bin/bash

if [[ "$(playerctl status)" == "No players found" ]]; then
    echo "no player found"
    exit 0
fi

# Get the title and remove unnecessary craps ex- " - YouTube Music"
title=$(playerctl metadata title 2>/dev/null | sed -E 's/( - (YouTube Music|YouTube)| \(Official Audio\)| \(Official Video\)|\(Official Music Video\))$//')

# Escape special characters for Waybar (e.g., replace & with &amp;)
title=${title//&/and}

# Read the last stored title
# last_title=$(cat /tmp/last_title 2>/dev/null)

# If the title is empty or "YouTube Music", restore the last valid one
# if [[ -z "$title" || "$title" == "YouTube Music" ]]; then
# 	title="$last_title"
# else
# 	echo "$title" >/tmp/last_title # Store the new title
# fi

if [[ "$(playerctl status 2>/dev/null)" == "Paused" ]]; then
    # Display frozen timestamp when paused
    echo "$title"
    exit 0
fi

# Get position and length, ensuring they are valid
pos=$(playerctl position 2>/dev/null)
len=$(playerctl metadata mpris:length 2>/dev/null)

# If either is empty (indicating player closed), show ASCII and exit
if [[ -z "$pos" || -z "$len" ]]; then
    echo " "
    exit 0
fi

# Get the current position and length, handling errors
timestamps=$(awk '{
  pos = $1;              
  len = $2 / 1000000;            
  printf "(%d:%02d/%d:%02d)\n", pos / 60, pos % 60, len / 60, len % 60;
}' <(echo "$(playerctl position 2>/dev/null) $(playerctl metadata mpris:length 2>/dev/null)"))

# Output the formatted string
player=$(playerctl metadata xesam:url 2>/dev/null)
if [[ $player == *spotify* ]]; then
    echo " $title$timestamps"
elif [[ $player == *youtube* ]]; then
    echo " $title$timestamps"
elif [[ $player == *instagram* ]]; then
    echo " "
else
    echo "󰽱 $title$timestamps"
fi
