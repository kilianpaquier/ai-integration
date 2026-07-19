#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

# renovate: datasource=github-tags packageName=JuliusBrussee/caveman depName=caveman
caveman_version=0d95a81d35a9f2d123a5e9430d1cfc43d55f1bb0 # v1.9.1
caveman_destinations="$dir/../../plugins/hooks/caveman-autostart/rules/caveman.md"
"$dir/extract-git.sh" https://github.com/JuliusBrussee/caveman.git skills/caveman/SKILL.md "$caveman_destinations" $caveman_version

for dest in $caveman_destinations; do
  # remove frontmatter from the extracted files
  sed -i -e '2,/^---$/d' -e '1d' "$dest"
done
