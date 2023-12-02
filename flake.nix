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
        date = "nightly";
      };

      defaultPackage.${nixpkgs.system} = self.packages.${nixpkgs.system}.rust;
    };
}
