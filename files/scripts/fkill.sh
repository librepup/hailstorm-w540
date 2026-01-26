#!/usr/bin/env bash
# Fuzzy Kill

fkill() {
  local line pid
  # Pick a process
  line=$(ps -ef | sed 1d | fzf) || return
  pid=$(awk '{print $2}' <<< "$line") || return
  # Ask for confirmation
  echo "Selected: $line"
  read -q "REPLY?Kill process $pid? [y/N] "
  echo  # newline after read -q
  if [[ "$REPLY" == [yY] ]]; then
    kill -9 "$pid"
    echo "Killed process $pid"
  else
    echo "Aborted."
  fi
}
