#!/bin/sh
xrandr \
--output DVI-I-2-2 --mode 1920x1080 --pos 0x0 --rotate normal \
--output eDP-1 --primary --mode 2560x1440 --pos 688x1080 --rotate normal \
--output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
--output DP-3 --off \
--output DP-2 --off \
--output DP-1 --off
