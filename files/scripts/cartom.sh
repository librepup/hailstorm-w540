#!/usr/bin/env bash
# Open Cargo.toml in the way of your Path

cartom() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/Cargo.toml" ]]; then
      nixmacs -nw "$dir/Cargo.toml"
      return 0
    fi
    dir=$(dirname "$dir")  # go one directory up
  done
  echo "Couldn't find 'Cargo.toml' in any parent directory."
  return 1
}
