#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

################################################################
#
# Codebase memory mcp C inline skill to skill
#
################################################################

# renovate: datasource=github-tags packageName=DeusData/codebase-memory-mcp depName=codebase-memory-mcp
codebase_memory_mcp_version=46ae198fc11cda80e817acbc5f5908d7c2de7032 # v0.10.8

codebase_memory_mcp_cli_c="$(mktemp)"
"$dir/helpers/extract-git.sh" https://github.com/DeusData/codebase-memory-mcp.git src/cli/cli.c "$codebase_memory_mcp_cli_c" "$codebase_memory_mcp_version"
codebase_memory_mcp_skill_dest="$dir/../../plugins/codebase-memory-mcp/skills/codebase-memory/SKILL.md"
"$dir/helpers/extract-c-string.sh" "$codebase_memory_mcp_cli_c" skill_content "$codebase_memory_mcp_skill_dest"
rm -f "$codebase_memory_mcp_cli_c"

# upstream frontmatter description contains an unquoted ": " (invalid YAML), quote it
sed -i -e '3{/^description: "/!s/^description: \(.*\)$/description: "\1"/}' "$codebase_memory_mcp_skill_dest"
