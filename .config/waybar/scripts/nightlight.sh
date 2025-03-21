#!/bin/bash

export WAYLAND_DISPLAY=wayland-1

export XDG_RUNTIME_DIR=/run/user/$(id -u)

hyprsunset --temperature 4500

