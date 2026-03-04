#!/usr/bin/env bash
mode=$(swaymsg -t get_bar_config bar-0 | jq -r '.mode')
if [ "$mode" = "invisible" ]; then
    swaymsg bar bar-0 mode dock
else
    swaymsg bar bar-0 mode invisible
fi
