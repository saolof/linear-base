#!/usr/bin/env nix-shell
#!nix-shell shell.nix -i bash --pure
#
# Format linear-base using pinned version of Ormolu.

set -e

export LANG="C.UTF-8"

cabal format

ormolu -m inplace $(find src -type f -name "*.hs-boot" -o -name "*.hs")
ormolu -m inplace $(find test -type f -name "*.hs-boot" -o -name "*.hs")
ormolu -m inplace $(find examples -type f -name "*.hs-boot" -o -name "*.hs")
ormolu -m inplace $(find bench -type f -name "*.hs-boot" -o -name "*.hs")
