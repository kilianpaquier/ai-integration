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

################################################################
#
# Context7 skill sync
#
################################################################

# renovate: datasource=git-refs packageName=https://github.com/upstash/context7 depName=context7
context7_version=c3248289c2ad431a9f34849a3f3d047fc4400373 # master

context7_mcp_skill_dest="$dir/../../plugins/context7/.apm/skills/context7-mcp/SKILL.md"
"$dir/helpers/extract-git.sh" https://github.com/upstash/context7.git skills/context7-mcp/SKILL.md "$context7_mcp_skill_dest" "$context7_version"

# only sync docs part to keep the SKILL focused on docs search and not setup or skills installation
context7_cli_docs_dest="$dir/../../plugins/context7/.apm/skills/context7-cli/references/docs.md"
"$dir/helpers/extract-git.sh" https://github.com/upstash/context7.git skills/context7-cli/references/docs.md "$context7_cli_docs_dest" "$context7_version"
