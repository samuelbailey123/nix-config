{
  description = "nix-config"

  imports = [
    ./core/packages.nix
  ];

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  }

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs:
  let
    inherit (inputs.nixpkgs.lib) genAttrs;
    inherit (self) outputs;
    forAllSystems = genAttrs [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
  in

}
