#!/bin/bash
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export WAYLAND_DISPLAY=wayland-1

# Clean stale socket
if [ -e "$XDG_RUNTIME_DIR/wayland-0" ]; then
	lsof "$XDG_RUNTIME_DIR/wayland-0" || rm -f "$XDG_RUNTIME_DIR/wayland-0"
fi

cd

exec Hyprland

# Wait for a moment to let's the system be ready
sleep 5

# start a tmux server if is not running already
if ! pgrep -x "tmux" >/dev/null; then
    tmux start-server
    tmux new-session -d -s test
    sleep 1
    tmux kill-session -t test
fi

