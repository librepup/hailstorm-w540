#!/usr/bin/env bash
# LUKS Encryption

cryptmount() {
  if [[ -z "$1" ]]; then
    echo "Type cryptmount /dev/DRIVE."
    return 1
  fi
  DRIVE="$1"
  doas cryptsetup --type luks open "$DRIVE" encrypted || {
    echo " Failed to open encrypted container."
    return 1
  }
  doas mount -t ext4 /dev/mapper/encrypted /mounted || {
    echo "Failed to mount."
    return 1
  }
}
cryptunmount() {
  doas umount /mounted
  doas cryptsetup close encrypted
}

# Extra Crypt
extramount() {
  doas cryptsetup open /dev/sda2 extradisk
  doas mount /dev/mapper/extradisk /extra
}
extraunmount() {
  doas umount /extra
  doas cryptsetup close extradisk
}
