#!/bin/sh

set -e

source_file="$1"
var_name="$2"
destinations="$3"

if [ -z "$source_file" ] || [ -z "$var_name" ] || [ -z "$destinations" ]; then
  echo "Usage: $0 <source_file> <var_name> <destinations>"
  exit 1
fi

echo "Extracting C string '$var_name' from $source_file"

tmp_file="$(mktemp)"
cleanup() {
  rm -f "$tmp_file"
}
trap cleanup EXIT

# Expects a multi-line `static const char <var_name>[] = "..." "..." ...;` C string
# literal, only escaping `\"` and `\n`. Concatenates the literal lines like a C
# compiler would, then decodes the two escapes. Comment lines (e.g. a /* ... */
# block between the declaration and the first literal) are skipped: only lines
# that start with `"` once leading whitespace is trimmed are string content.
awk -v var="$var_name" '
  $0 ~ "static const char " var "\\[\\] =" { capturing = 1; next }
  capturing {
    line = $0
    sub(/^[ \t]+/, "", line)
    if (line !~ /^"/) { next }
    sub(/^"/, "", line)
    ended = (line ~ /";[ \t]*$/)
    sub(/";?[ \t]*$/, "", line)
    printf "%s", line
    if (ended) { exit }
  }
' "$source_file" \
  | sed -e 's/\\"/@ESCAPED_QUOTE@/g' -e 's/@ESCAPED_QUOTE@/"/g' \
  | awk 'BEGIN { ORS = "" } { gsub(/\\n/, "\n"); print }' \
  > "$tmp_file"

if [ ! -s "$tmp_file" ]; then
  echo "Failed to extract '$var_name' from $source_file: pattern not found or empty result" >&2
  exit 1
fi

for dest in $destinations; do
  mkdir -p "$(dirname "$dest")"
  cp "$tmp_file" "$dest"

  if [ -n "$(tail -c1 "$dest")" ]; then
    printf '\n' >> "$dest"
  fi
done
