#!/bin/bash

# Wait for a moment to let's the system be ready
sleep 5

# start a tmux server if is not running already
if ! pgrep -x "tmux" >/dev/null; then
    tmux start-server
    tmux new-session -d -s test
    sleep 1
    tmux kill-session -t test
fi
