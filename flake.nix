{
  description = "nix-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # I think I import here? but how to I put it into the output?
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
    templates = {
      packages = {
        description = ''
          Core Packages
        '';
        path = ./core/packages;
      };
      shell = {
        description = ''
          Core Shell
        '';
        path = ./core/shell.nix;
      };
    };
  };
}
