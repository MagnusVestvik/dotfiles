#!/usr/bin/env bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 1
done

if command -v xrandr >/dev/null; then
  while IFS= read -r monitor; do
    MONITOR="$monitor" polybar --reload main &
  done < <(xrandr --query | awk '/ connected/{print $1}')
else
  polybar --reload main &
fi
