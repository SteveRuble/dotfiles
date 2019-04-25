#!/bin/sh

# This script configures screens when docked to the visiontek dock.

xrandr \
--output eDP-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
--output DVI-I-1-1 --mode 1920x1200 --pos 3840x0 --rotate normal \
--output DVI-I-2-2 --mode 1920x1200 --pos 5760x0 --rotate normal \
--output DP-3 --off \
--output DP-2 --off \
--output DP-1 --off
