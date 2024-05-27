{
  description = "Nix for macOS configuration";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = { substituters = [ "https://cache.nixos.org" ]; };

  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, ... }:
    let
      overlays = [];

      hopeanuoli_specialArgs = inputs // {
        inherit overlays;
        username = "pyry";
        hostname = "hopeanuoli";
      };

      FL_specialArgs = inputs // {
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
      colmena = {
        meta = {
          nixpkgs = import nixpkgs { system = "x86_64-linux"; };
          specialArgs = {

          };
        };
        koti = import ./hosts/koti/default.nix;
      };
    };
}
