#!/usr/bin/env bash
pmset -g batt | rg --only-matching [0-9][0-9]%
