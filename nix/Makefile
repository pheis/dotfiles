deploy:
	nix build .#darwinConfigurations.anser.system
	./result/sw/bin/darwin-rebuild switch --flake .#anser
