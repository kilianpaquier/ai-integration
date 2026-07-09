#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

# renovate: datasource=github-tags packageName=JuliusBrussee/caveman depName=caveman
caveman_version=0d95a81d35a9f2d123a5e9430d1cfc43d55f1bb0 # v1.9.1
"$dir/extract-git.sh" \
  https://github.com/JuliusBrussee/caveman.git \
  src/rules/caveman-activate.md \
  "$dir/../../plugins/caveman-autostart/rules/caveman-activate.md" \
  $caveman_version
