#!/usr/bin/env bash
# Build Nix Packages

buildnix() {
  if [[ -f "package.nix" ]]; then
      echo "[ Found 'package.nix', building now... ]"
      nix-build -E 'with import <nixpkgs> {}; callPackage ./package.nix {}'
      echo "[ Successfully build Package. ]"
      return 1
  elif [[ -f "default.nix" ]]; then
      echo "[ Found 'default.nix', building now... ]"
      nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'
      echo "[ Successfully build Package. ]"
      return 1
  else
      echo "[ Error: No 'default.nix' or 'package.nix' found! ]"
  fi
}
