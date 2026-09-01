#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"
docs="$dir/../../docs/content/interoperability/ai-integration"
plugins="$dir/../../plugins"

start='<!-- docs:start -->'
end='<!-- docs:end -->'

tmp_files=""
cleanup() {
  # shellcheck disable=SC2086 # $tmp_files is a space-separated list of paths
  rm -f $tmp_files
}
trap cleanup EXIT

# replaces the content between the "$start" and "$end" markers in $out
# with the content between the same markers in $src (i.e. $src's plugin-specific body).
sync_tab() {
  src="$1"
  out="$2"

  # read the plugin-specific body out of $src, between its own markers
  body="$(mktemp)"
  tmp_files="$tmp_files $body"
  awk "/$start/{f=1;next} /$end/{f=0} f" "$src" > "$body"

  # both guards below prevent a silent wipe of $out's section
  if [ ! -s "$body" ]; then
    echo "$src: nothing between the '$start' and '$end' markers" >&2
    return 1
  fi
  if ! grep -qF "$start" "$out"; then
    echo "$out: missing the '$start' marker" >&2
    return 1
  fi

  # remove the stale section currently in $out, then print the body in-between
  sed -i "/$start/,/$end/{/$start/!{/$end/!d}}" "$out"
  sed -i "/$start/r $body" "$out"
}

missing=""
for readme in "$plugins"/*/README.md; do
  plugin="$(basename "$(dirname "$readme")")"

  for lang in en fr; do
    out="$docs/$plugin.$lang.md"
    if [ ! -f "$out" ]; then
      missing="$missing $plugin.$lang.md"
      continue
    fi
    sync_tab "$readme" "$out"
  done
done

if [ -n "$missing" ]; then
  echo "missing documentation pages under docs/content/interoperability/ai-integration:$missing" >&2
  exit 1
fi
