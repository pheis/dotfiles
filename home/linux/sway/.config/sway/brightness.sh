#!/usr/bin/env bash

if asdbctl get 2>/dev/null | grep -q 'brightness'; then
    upcmd="asdbctl up"
    downcmd="asdbctl down"
    getcmd="asdbctl get"
else
    upcmd="brightnessctl set 5%+"
    downcmd="brightnessctl set 5%-"
    getcmd="brightnessctl get"
fi

case "$1" in
    up)   $upcmd ;;
    down) $downcmd ;;
    get)  $getcmd ;;
    *)    echo "Usage: $0 up|down|get" >&2; exit 1 ;;
esac
