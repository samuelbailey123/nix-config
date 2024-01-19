{
  description = "Samuel's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#IMUBIT-SAMUELB
    darwinConfigurations."IMUBIT-SAMUELB" = nix-darwin.lib.darwinSystem {
      modules = [ ./core/packages.nix
      home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.samuelbailey = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
       ];
    };

    darwinConfigurations."test" = nix-darwin.lib.darwinSystem {
      modules = [ ./core/packages.nix ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."IMUBIT-SAMUELB".pkgs;
  };
}
