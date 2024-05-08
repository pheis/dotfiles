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
    ...
  }: let
    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];


    hopeanuoli_specialArgs =
      inputs
      // {
        inherit overlays;
        username = "pyry";
        hostname = "hopeanuoli";
      };

    FL_specialArgs  =
      inputs
      // {
        inherit overlays;
        username = "pyry.heiskanen";
        hostname = "FL";
      };
  in {
    darwinConfigurations = {
    hopeanuoli = darwin.lib.darwinSystem {
      specialArgs = hopeanuoli_specialArgs;
      system = "aarch64-darwin";
      modules = [
        ./darwin/nix-core.nix
        ./darwin/system.nix
        ./darwin/apps.nix
        ./darwin/host-users.nix
      ];
    };
    FL = darwin.lib.darwinSystem {
      specialArgs = FL_specialArgs;
      system = "aarch64-darwin";
      modules = [
        ./darwin/nix-core.nix
        ./darwin/system.nix
        ./darwin/apps.nix
        ./darwin/host-users.nix
      ];
    };
    };
  };
}
