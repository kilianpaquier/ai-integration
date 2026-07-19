#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"
src_start='<!-- docs-tab:start -->'
src_end='<!-- docs-tab:end -->'

tmp_files=""
cleanup() {
  # shellcheck disable=SC2086 # $tmp_files is a space-separated list of paths
  rm -f $tmp_files
}
trap cleanup EXIT

# replaces the content between "<!-- docs-sync:$section:start -->" and
# "<!-- docs-sync:$section:end -->" markers in $out with the content between
# $src_start and $src_end in $src (i.e. $src's plugin-specific body).
sync_tab() {
  src="$1"
  out="$2"
  section="$3"
  start="<!-- docs-sync:$section:start -->"
  end="<!-- docs-sync:$section:end -->"

  # read the plugin-specific body out of $src, between its own markers
  body="$(mktemp)"
  tmp_files="$tmp_files $body"
  awk "/$src_start/{f=1;next} /$src_end/{f=0} f" "$src" > "$body"

  # remove the stale section currently in $out, then print the body in-between
  sed -i "/$start/,/$end/{/$start/!{/$end/!d}}" "$out"
  sed -i "/$start/r $body" "$out"
}

caveman_out="$dir/../../docs/content/interoperability/ai-integration/caveman.en.md"
sync_tab "$dir/../../plugins/hooks/caveman-autostart/README.md" "$caveman_out" hook

# keep docs sections up-to-date with README.md
cp "$dir/../../plugins/hooks/protected-paths/README.md" "$dir/../../docs/content/interoperability/ai-integration/protected-paths.en.md"
cp "$dir/../../plugins/skills/schema-converter/README.md" "$dir/../../docs/content/interoperability/ai-integration/schema-converter.en.md"
