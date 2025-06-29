#!/bin/bash

# Get the name of the laptop screen (usually eDP-1 or eDP-1-1)
LAPTOP="eDP-1"

# Find all connected external monitors (not eDP)
EXTERNALS=$(xrandr | grep " connected" | grep -v "$LAPTOP" | awk '{print $1}')

if [ -n "$EXTERNALS" ]; then
    for MON in $EXTERNALS; do
        # Get the maximum resolution for this monitor
        MAXRES=$(xrandr | grep -A1 "^$MON connected" | tail -n1 | awk '{print $1}')
        # Set the external monitor to its max resolution and make it primary
        xrandr --output "$MON" --mode "$MAXRES" --primary
    done
    # Turn off the laptop screen
    xrandr --output "$LAPTOP" --off
else
    # No external monitor, turn on the laptop screen at its max resolution
    MAXRES=$(xrandr | grep -A1 "^$LAPTOP connected" | tail -n1 | awk '{print $1}')
    xrandr --output "$LAPTOP" --mode "$MAXRES" --primary
fi
