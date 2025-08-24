#!/bin/bash

if [[ "$(playerctl status)" == "No players found" ]]; then
    echo "no player found"
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

# Get the title and remove unnecessary craps ex- " - YouTube Music"
title=$(playerctl metadata title 2>/dev/null | sed -E 's/( - (YouTube Music|YouTube)| \(Official Audio\)| \(Official Video\)|\(Official Music Video\))$//')
artist=$(playerctl metadata xesam:artist 2>/dev/null)

# Escape special characters for Waybar (e.g., replace & with &amp;)
# title=${title//&/and}
art_url=$(playerctl metadata mpris:artUrl 2>/dev/null)
player=$(playerctl metadata xesam:url 2>/dev/null)

if [[ "$(playerctl status 2>/dev/null)" == "Paused" ]]; then
    # Display frozen timestamp when paused
    if [[ $player == *spotify* ]]; then
        echo "  $title - $artist"
    elif [[ $player == *music.youtube.com* ]]; then
        echo "  $title - $artist"
    elif [[ $player == *youtube* ]]; then
        echo "  $title"
    elif [[ $player == *instagram* ]]; then
        echo "  "
    elif [[ $art_url == *kdeconnect* ]]; then
        echo "   $title - $artist"
    else
        echo " 󰽱 $title"
    fi
fi

# Output the formatted string
if [[ $player == *spotify* ]]; then
    echo "   $title - $artist$timestamps"
elif [[ $player == *youtube* ]]; then
    echo "   $title - $artist$timestamps"
elif [[ $player == *music.youtube.com* ]]; then
    echo "  $title - $artist$timestamps"
elif [[ $art_url == *kdeconnect* ]]; then
    echo "   $title - $artist$timestamps"
elif [[ $player == *instagram* ]]; then
    echo "  "
else
    echo "󰽱 $title$timestamps"
fi
