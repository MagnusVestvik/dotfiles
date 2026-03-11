#!/bin/bash
# Automatically change wallpaper every 10 minutes
#swaybg -i $(fd '^.*[^.]$' ~/wallpapers/ | shuf -n1) -m fill &
#swaybg -i ~/wallpapers/uwp4984875.jpeg
swaybg -i ~/wallpapers/gel2r6g9pvjg1.jpeg 
#OLD_PID=$!
#while true; do
#    sleep 120
#    swaybg -i $(find ~/.config/sway/wallpaper/. -name "*.png" | shuf -n1) -m fill &
#    NEXT_PID=$!
#    sleep 5
#    kill $OLD_PID
#    OLD_PID=$NEXT_PID
#done
