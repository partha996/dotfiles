#!/bin/bash
if [[ "$(playerctl status 2>/dev/null)" == "No players found" ]]; then
    echo "(^. .^)"

elif [[ "$(playerctl status)" == "Paused" ]]; then
    echo "  "
elif [[ "$(playerctl status)" == "Playing" ]]; then

    echo "❚❚"

fi
