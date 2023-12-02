{
  description = "nix-config";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2305.491812.tar.gz";
  };

  # Flake outputs
  outputs = { self, nixpkgs }:
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
      # Development environment output
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          # The Nix packages provided in the environment
          packages = with pkgs; [
            pkgs.bat
            pkgs.curl
            pkgs.coreutils
            pkgs.exa
            pkgs.git
            pkgs.gh
            pkgs.helm
            pkgs.jq
            pkgs.kubectl
            pkgs.k9s
            pkgs.pgcli
            pkgs.rclone
            pkgs.rsync
            pkgs.watch
            pkgs.wget
            pkgs.tmux
            pkgs.vault
            pkgs.vim
            pkgs.telnet
            pkgs.starship
          ];
        };
      });
    };
}
