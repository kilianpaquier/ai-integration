#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

# copies $1 to $2, ensuring the destination ends with a trailing newline (matches
# what every upstream file already does, in case a future one doesn't).
copy_file() {
  mkdir -p "$(dirname "$2")"
  cp "$1" "$2"

  if [ -n "$(tail -c1 "$2")" ]; then
    printf '\n' >> "$2"
  fi
}

################################################################
#
# Codebase memory mcp C inline skill to skill
#
################################################################

# renovate: datasource=github-tags packageName=DeusData/codebase-memory-mcp depName=codebase-memory-mcp
codebase_memory_mcp_version=46ae198fc11cda80e817acbc5f5908d7c2de7032 # v0.10.8

codebase_memory_mcp_tmp="$("$dir/helpers/git-clone.sh" https://github.com/DeusData/codebase-memory-mcp.git "$codebase_memory_mcp_version")"
codebase_memory_mcp_skill_dest="$dir/../../plugins/codebase-memory-mcp/.apm/skills/codebase-memory/SKILL.md"
"$dir/helpers/extract-c-string.sh" "$codebase_memory_mcp_tmp/src/cli/cli.c" skill_content "$codebase_memory_mcp_skill_dest"
rm -rf "$codebase_memory_mcp_tmp"

# upstream frontmatter description contains an unquoted ": " (invalid YAML), quote it
sed -i -e '3{/^description: "/!s/^description: \(.*\)$/description: "\1"/}' "$codebase_memory_mcp_skill_dest"

################################################################
#
# Context7 skill sync
#
################################################################

# renovate: datasource=git-refs packageName=https://github.com/upstash/context7 depName=context7
context7_version=c3248289c2ad431a9f34849a3f3d047fc4400373 # master

context7_tmp="$("$dir/helpers/git-clone.sh" https://github.com/upstash/context7.git "$context7_version")"
context7_skills_dest="$dir/../../plugins/context7/.apm/skills"

copy_file "$context7_tmp/skills/context7-mcp/SKILL.md" "$context7_skills_dest/context7-mcp/SKILL.md"

# only sync docs part to keep the SKILL focused on docs search and not setup or skills installation
copy_file "$context7_tmp/skills/context7-cli/references/docs.md" "$context7_skills_dest/context7-cli/references/docs.md"
rm -rf "$context7_tmp"
