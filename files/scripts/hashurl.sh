#!/usr/bin/env bash
# Get Nix SRI sha256 Hash from URL

hashurl() {
  URL=$@
  HASH=$(nix-prefetch-url $URL)
  FINAL=$(nix hash convert --to sri --hash-algo sha256 $HASH)
  echo -e "\nYour SRI sha256 Hash is:\n$FINAL"
}
