#!/bin/sh
xrandr --output DP-1-1-1 --off \
    --output eDP-1 --primary --mode 3840x2160 --pos 0x0 --scale 0.56x0.56 --rotate normal \
    --output DP-1-1 --off \
    --output HDMI-2 --off \
    --output HDMI-1 --off \
    --output DP-1-8 --auto --pos 2151x0 --rotate normal  --scale 1x1 \
    --output DP-2 --off \
    --output DP-1 --off \
    --output DP-1-1-8 --auto --right-of DP-1-8 --rotate normal