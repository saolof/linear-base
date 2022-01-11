{ system ? builtins.currentSystem, sources ? import ./nix/sources.nix }:

let
  replaceOrmolu = self: super: {
    ormolu = (import sources.ormolu {}).ormolu;
  };
  pkgs = import sources.nixpkgs { inherit system; overlays = [ replaceOrmolu ]; };
in with pkgs;

mkShell {
  # Set UTF-8 local so that run-tests can parse GHC's unicode output.
  LANG="C.UTF-8";

  buildInputs = [
    haskell.compiler.ghc901
    cabal-install
    git
    nix
    stack
    cacert
    ormolu
  ];
}


