#!/bin/sh

set -e

repository="$1"
element="$2"
destination="$3"
rev="$4"

if [ -z "$repository" ] || [ -z "$element" ] || [ -z "$destination" ]; then
  echo "Usage: $0 <repository> <element> <destination> [rev]"
  exit 1
fi

echo "Extracting $element from $repository${rev:+@$rev} to $destination"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

if [ -n "$rev" ]; then
  git clone --depth=1 "$repository" "$tmp_dir" && git -C "$tmp_dir" checkout -q "$rev"
else
  git clone --depth=1 "$repository" "$tmp_dir"
fi
rm -rf "$destination"
cp -r "$tmp_dir/$element" "$destination"
