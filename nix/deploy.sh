#!/bin/bash

current_host=$(uname -n)

nix build .#darwinConfigurations."$current_host".system
./result/sw/bin/darwin-rebuild switch --flake .#"$current_host"

