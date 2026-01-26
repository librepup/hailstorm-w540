#!/usr/bin/env bash

# Random String Generator
random() {
  local len
  if [ -z "$1" ]; then
    len=12
  else
    len="$1"
  fi
  head /dev/urandom | tr -dc A-Za-z0-9 | head -c "$len"
  echo
}

# Password Generator
password() {
  local len
  local file="/mnt/Files/Temp/RandomPasswords.DD"
  if [ -z "$1" ]; then
    len=24
    local pass=$(openssl rand -base64 24)
  else
    len="$1"
    local pass=$(openssl rand -base64 "$len")
  fi
  if ! [ -e "$file" ]; then
    touch "$file"
  fi
  echo "$pass" >> /mnt/Files/Temp/RandomPasswords.DD
  echo -e "Printed Password to /mnt/Files/Temp/RandomPasswords.DD.\nPassword: $pass"
}
