#!/bin/sh

set -e

repository="$1"
element="$2"
destinations="$3"
rev="$4"

if [ -z "$repository" ] || [ -z "$element" ] || [ -z "$destinations" ]; then
  echo "Usage: $0 <repository> <element> <destinations> [rev]"
  exit 1
fi

echo "Extracting $element from $repository${rev:+@$rev}"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

git init -q "$tmp_dir"
git -C "$tmp_dir" remote add origin "$repository"
git -C "$tmp_dir" fetch --depth=1 -q origin "${rev:-HEAD}"
git -C "$tmp_dir" checkout -q FETCH_HEAD

for dest in $destinations; do
  rm -rf "$dest"
  cp -r "$tmp_dir/$element" "$dest"

  if [ -f "$dest" ] && [ -n "$(tail -c1 "$dest")" ]; then
    printf '\n' >> "$dest"
  fi
done
