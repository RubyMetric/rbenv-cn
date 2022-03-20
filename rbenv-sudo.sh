#!/usr/bin/env bash

# Set colored output for TTY
if [ -t 1 ]; then
  color="\e[1;32m"
  reset="\e[0m"
else
  color=""
  reset=""
fi

echo_colored() {
  printf "${color}%s${reset}\n" "$1"
}

echo_colored "rbenv-cn> Deprecated, 请以后使用 'rbenv sudo <command>' "