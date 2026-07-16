#!/bin/sh

./updater.sh

if ! command apm >/dev/null >&2; then
  curl -sSL https://aka.ms/apm-unix | sh
fi

apm pack
