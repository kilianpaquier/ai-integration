#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

# keep docs sections up-to-date with README.md
cp "$dir/../../plugins/hooks/protected-paths/README.md" "$dir/../../docs/content/interoperability/ai-integration/protected-paths.en.md"
cp "$dir/../../plugins/skills/schema-converter/README.md" "$dir/../../docs/content/interoperability/ai-integration/schema-converter.en.md"
