#!/usr/bin/env bash
while true; do
    bat=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
    status=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
    # echo "🔋${bat}% ${status} | $(date +'%Y-%m-%d %X')"
    printf "🔋%s%% %s | %s" "$bat" "$status" "$(date +'%Y-%m-%d %X')"
    sleep 30
done
