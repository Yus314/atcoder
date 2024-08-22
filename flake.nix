{
  description = "Rust development environment with Nix Flakes";
  #ref https://nixos.wiki/wiki/Rust

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            #clang
            #llvmPackages_latest.bintools
            rustup
          ];
        };
      }
    );
}
