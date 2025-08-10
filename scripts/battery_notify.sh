#!/bin/bash

while true;
do
BATTERY=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
PERCENT=$(echo "$BATTERY" | grep percentage | awk '{print $2}' | sed 's/%//')
STATE=$(echo "$BATTERY" | grep state | awk '{print $2}')

if [[ "$STATE" == "discharging" && "$PERCENT" -le 15 ]]; then
    notify-send "⚠️ Baterai Low" "Baterai tinggal $PERCENT%. Segera cas!"
fi
sleep 2
done
