{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#IMUBIT-SAMUELB
    darwinConfigurations."IMUBIT-SAMUELB" = nix-darwin.lib.darwinSystem {
      modules = [ ./core/packages.nix ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."IMUBIT-SAMUELB".pkgs;
  };
}
