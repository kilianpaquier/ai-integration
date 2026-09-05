#!/bin/sh

set -e

dir="$(realpath "$(dirname "$0")")"

error() {
  echo "$1" >&2
  return 1
}

tmp_root="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_root"
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

# every mktemp below, the helper scripts included, lands under $tmp_root and dies with it
export TMPDIR="$tmp_root"

copy_file() {
  mkdir -p "$(dirname "$2")"
  sed 's/[[:space:]]*$//' "$1" > "$2" # remove trailing whitespaces to avoid pre-commit hook failures
  if [ -n "$(tail -c1 "$2")" ]; then
    printf '\n' >> "$2"
  fi
}

# replaces $2's body with $1's body, keeping $2's own frontmatter.
missing=""
sync_body() {
  src="$1"
  out="$2"

  # without it the body cannot be split off, and $out would end up frontmatter-only
  head -n1 "$src" | grep -qxF -- '---' || error "$src: expected frontmatter on line 1, cannot split the body off"

  if [ ! -f "$out" ] || ! head -n1 "$out" | grep -qxF -- '---'; then
    missing="$missing $out"
    return 0
  fi

  merged="$(mktemp)"
  # the first awk stops on the frontmatter fence, before any body separator, the second starts after it
  awk 'NR == 1 { print; next } { print } $0 == "---" { exit }' "$out" > "$merged"
  awk 'f { print } !f && NR > 1 && $0 == "---" { f = 1 }' "$src" >> "$merged"

  copy_file "$merged" "$out"
}

################################################################
#
# Codebase memory mcp C inline skill to skill
#
################################################################

# renovate: datasource=github-tags packageName=DeusData/codebase-memory-mcp depName=codebase-memory-mcp
codebase_memory_mcp_version=46ae198fc11cda80e817acbc5f5908d7c2de7032 # v0.10.8

codebase_memory_mcp_tmp="$("$dir/helpers/git-clone.sh" https://github.com/DeusData/codebase-memory-mcp.git "$codebase_memory_mcp_version")"
codebase_memory_mcp_skill="$(mktemp)"
"$dir/helpers/extract-c-string.sh" "$codebase_memory_mcp_tmp/src/cli/cli.c" skill_content "$codebase_memory_mcp_skill"
codebase_memory_mcp_skill_dir="$dir/../../plugins/codebase-memory-mcp/.apm/skills/codebase-memory"
sync_body "$codebase_memory_mcp_skill" "$codebase_memory_mcp_skill_dir/SKILL.md"
copy_file "$codebase_memory_mcp_tmp/LICENSE" "$codebase_memory_mcp_skill_dir/LICENSE"

################################################################
#
# Context7 skill sync
#
################################################################

# renovate: datasource=git-refs packageName=https://github.com/upstash/context7 depName=context7
context7_version=c3248289c2ad431a9f34849a3f3d047fc4400373 # master

context7_tmp="$("$dir/helpers/git-clone.sh" https://github.com/upstash/context7.git "$context7_version")"
context7_skills_dest="$dir/../../plugins/context7/.apm/skills"

sync_body "$context7_tmp/skills/context7-mcp/SKILL.md" "$context7_skills_dest/context7-mcp/SKILL.md"
# only sync docs part to keep the SKILL focused on docs search and not setup or skills installation
copy_file "$context7_tmp/skills/context7-cli/references/docs.md" "$context7_skills_dest/context7-cli/references/docs.md"

# add vendored LICENSE files (legal requirement)
copy_file "$context7_tmp/LICENSE" "$context7_skills_dest/context7-mcp/LICENSE"
copy_file "$context7_tmp/LICENSE" "$context7_skills_dest/context7-cli/references/LICENSE"

################################################################
#
# Caveman
#
################################################################

# renovate: datasource=github-tags packageName=JuliusBrussee/caveman depName=caveman
caveman_version=ae10845a5e4c958db8a5b52018c9ebc7ce534874 # v2.4.0

caveman_tmp="$("$dir/helpers/git-clone.sh" https://github.com/JuliusBrussee/caveman.git "$caveman_version")"
caveman_dir="$dir/../../plugins/caveman"
caveman_apm_dir="$caveman_dir/.apm"
caveman_scripts_dir="$caveman_dir/scripts"

for skill in caveman caveman-commit caveman-explore; do
  sync_body "$caveman_tmp/skills/$skill/SKILL.md" "$caveman_apm_dir/skills/$skill/SKILL.md"
  copy_file "$caveman_tmp/LICENSE" "$caveman_apm_dir/skills/$skill/LICENSE"
done
for hook_module in caveman-config caveman-parse; do
  copy_file "$caveman_tmp/src/hooks/$hook_module.js" "$caveman_scripts_dir/vendor/$hook_module.js"
done
copy_file "$caveman_tmp/LICENSE" "$caveman_scripts_dir/vendor/LICENSE"

# inline the already-synced caveman SKILL.md (frontmatter stripped) into the session start script
caveman_rules="$(mktemp)"
sed -e '2,/^---$/d' -e '1d' "$caveman_apm_dir/skills/caveman/SKILL.md" > "$caveman_rules"
caveman_escaped="$(mktemp)"
# shellcheck disable=SC2016
sed -e 's/\\/\\\\/g' -e 's/`/\\`/g' -e 's/\${/\\${/g' "$caveman_rules" > "$caveman_escaped"
caveman_script="$caveman_scripts_dir/caveman-activate.js"

# without both markers the sed below silently no-ops, or deletes everything down to EOF
for caveman_marker in 'const SKILL = `' '`.trim()'; do
  grep -qxF -- "$caveman_marker" "$caveman_script" ||
    error "$caveman_script: missing the '$caveman_marker' marker the inline sed relies on"
done

# shellcheck disable=SC2016
sed -i -e '/^const SKILL = `$/,/^`\.trim()$/{//!d}' -e "/^const SKILL = \`\$/r $caveman_escaped" "$caveman_script"

################################################################

if [ -n "$missing" ]; then
  error "missing destination frontmatter, author it before syncing:$missing"
fi
