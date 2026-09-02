#!/bin/sh

set -e

repository="$1"
rev="$2"

if [ -z "$repository" ]; then
  echo "Usage: $0 <repository> [rev]"
  exit 1
fi

echo "Cloning $repository${rev:+@$rev}" >&2

tmp_dir="$(mktemp -d)"
git init -q "$tmp_dir"
git -C "$tmp_dir" remote add origin "$repository"
git -C "$tmp_dir" fetch --depth=1 -q origin "${rev:-HEAD}"
git -C "$tmp_dir" checkout -q FETCH_HEAD

echo "$tmp_dir"
