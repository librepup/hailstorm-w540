#!/usr/bin/env bash
# Disks Utility

disks() {
  case "$1" in
    type)
      watch -n 1 lsblk -f
      ;;
    ext)
      watch -n 1 lsblk -f
      ;;
    fdisk)
      doas watch -n 1 fdisk -l
      ;;
    *)
      watch -n 1 lsblk
      ;;
  esac
}
