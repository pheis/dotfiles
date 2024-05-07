.PHONY: install

install:
	cd nix && ./deploy.sh
	make -C "home"
