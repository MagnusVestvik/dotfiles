#!/usr/bin/env bash

if [[ -r /sys/class/hwmon/hwmon2/device/gpu_busy_percent ]]; then
  cat /sys/class/hwmon/hwmon2/device/gpu_busy_percent
  exit 0
fi

for file in /sys/class/hwmon/hwmon*/device/gpu_busy_percent; do
  if [[ -r "$file" ]]; then
    cat "$file"
    exit 0
  fi
done

printf "N/A"
