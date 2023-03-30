#!/bin/sh
set -e

isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi

  box help --no-interaction "$1" > /dev/null 2>&1
}

# check if the first argument passed in looks like a flag or is a file
if [ "${1#-}" != "$1" ] || isCommand "$1"; then
  set -- box "$@"
fi

set -- tini -- "$@"

exec "$@"
