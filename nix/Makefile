deploy:
	nix build .#darwinConfigurations.hopeanuoli.system
	./result/sw/bin/darwin-rebuild switch --flake .#hopeanuoli
