#!/bin/bash

# Get the window ID of the currently focused window
window_id=$(xdotool getwindowfocus)

# Get the class of the focused window
window_class=$(xprop -id $window_id | grep "WM_CLASS(STRING)" | awk -F '", "' '{print $2}' | sed 's/"//')

echo "$window_class"

