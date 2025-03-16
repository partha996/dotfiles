#!/bin/bash

if [[ "$(playerctl status)" == "Paused" ]]; then
    echo "  "
# elif [[ "$(playerctl status)" == "Playing" ]]; then
else
    echo "❚❚"
    # echo "o"
fi
