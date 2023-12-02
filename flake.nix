# flake.nix

{
  description = "Rust Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.${nixpkgs.system} or (import nixpkgs {});

    in
    {
      packages.${nixpkgs.system}.rust = pkgs.rustChannelOf {
        channel = "stable";
        date = "2021-12-01"; # Adjust to the desired date or use "nightly" for the latest nightly version
      };

      defaultPackage.${nixpkgs.system} = self.packages.${nixpkgs.system}.rust;
    };
}

