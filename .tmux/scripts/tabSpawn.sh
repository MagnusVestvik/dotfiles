#!/bin/bash

# Only proceed if there's 1 or fewer windows
window_count=$(tmux list-windows 2>/dev/null | wc -l)

if [ "$window_count" -le 1 ]; then
    # Rename first window or create it
    tmux rename-window -t 1 nvim 2>/dev/null || tmux new-window -t 1 -n nvim
    
    # Create other windows if they don't exist
    tmux new-window -t 2 -n general 2>/dev/null || true
    tmux new-window -t 3 -n git 2>/dev/null || true
    
    # Select the first window
    tmux select-window -t 1
fi
