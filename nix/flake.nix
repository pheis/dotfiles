{
  description = "Nix for macOS configuration";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    ...
  }: let
    username = "pyry";
    system = "aarch64-darwin";
    hostname = "hopeanuoli";

    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];


    specialArgs =
      inputs
      // {
        inherit username hostname overlays;
      };
  in {
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix
        ./modules/host-users.nix
      ];
    };
  };
}
