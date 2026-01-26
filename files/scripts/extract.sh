#!/usr/bin/env bash
# Universal Extractor

extract() {
  for archive in "$@"; do
    case "$archive" in
      *.tar.bz2)   tar xjf "$archive"   ;;
      *.tar.gz)    tar xzf "$archive"   ;;
      *.tar.xz)    tar xJf "$archive"   ;;
      *.tar.zst)   unzstd "$archive" | tar xf - ;;
      *.tar)       tar xf "$archive"    ;;
      *.bz2)       bunzip2 "$archive"   ;;
      *.gz)        gunzip "$archive"    ;;
      *.zip)       unzip "$archive"     ;;
      *.7z)        7z x "$archive"      ;;
      *.rar)       unrar x "$archive"   ;;
      *)           echo "Don't know how to extract $archive." ;;
    esac
  done
}
