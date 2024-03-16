.PHONY: stow-all

PLATFORM := $(shell uname | tr '[:upper:]' '[:lower:]')

stow-all:
	./stow-all shared
	./stow-all $(PLATFORM)
