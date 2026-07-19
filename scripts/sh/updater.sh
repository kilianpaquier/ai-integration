#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

# renovate: datasource=github-tags packageName=JuliusBrussee/caveman depName=caveman
caveman_version=0d95a81d35a9f2d123a5e9430d1cfc43d55f1bb0 # v1.9.1

caveman_tmp="$(mktemp)"
caveman_escaped="$(mktemp)"
trap 'rm -f "$caveman_tmp" "$caveman_escaped"' EXIT

caveman_destinations="$caveman_tmp"
"$dir/extract-git.sh" https://github.com/JuliusBrussee/caveman.git skills/caveman/SKILL.md "$caveman_destinations" $caveman_version

for dest in $caveman_destinations; do
  # remove frontmatter from the extracted files
  sed -i -e '2,/^---$/d' -e '1d' "$dest"
done

# embed caveman SKILL.md into autostart hook script
caveman_script="$dir/../../plugins/hooks/caveman-autostart/scripts/caveman-autostart"

# escape backslashes, backticks and template-literal interpolation
# shellcheck disable=SC2016
sed -e 's/\\/\\\\/g' -e 's/`/\\`/g' -e 's/\${/\\${/g' "$caveman_tmp" > "$caveman_escaped"
# replace everything between the `const RULES = `` and closing `` `.trim()``
# shellcheck disable=SC2016
sed -i \
  -e '/^const RULES = `$/,/^`\.trim()$/{//!d}' \
  -e "/^const RULES = \`\$/r $caveman_escaped" \
  "$caveman_script"
