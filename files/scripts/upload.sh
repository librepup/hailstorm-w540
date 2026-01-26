#!/usr/bin/env bash
# Upload Files
upload() {
  case "$1" in
    1)
      curl --upload-file $2 https://dropcli.com/upload
      ;;
    2)
      curl -T $2 -s -L -D - xfr.station307.com | grep human
      ;;
    *)
      echo "Please choose either '1' or '2' for a file hoster."
      ;;
  esac
}
