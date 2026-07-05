#!/bin/bash

set -e

INPUT=$(cat)
# transcript_path is agent bookkeeping metadata (always under ~/.claude/projects), not a tool
# argument; scanning it would block every single tool call once ~/.claude is denied.
stripped=$(echo "$INPUT" | sed -E 's/"transcript_path"[[:space:]]*:[[:space:]]*"[^"]*"/"transcript_path":""/')
normalized=$(echo "$stripped" | sed "s|~|$HOME|g; s|\$HOME|$HOME|g")

ALLOW_LIST=(
  # apm
  "$HOME/.apm/apm.yml"
  "$HOME/.apm/apm_modules"
  "$HOME/.apm/cache"
  "$HOME/.apm/config.json"
  "$HOME/.apm/marketplaces.json"
  # claude
  "$HOME/.claude/CLAUDE.md"
  "$HOME/.claude/agent-memory"
  "$HOME/.claude/agents"
  "$HOME/.claude/commands"
  "$HOME/.claude/hooks"
  "$HOME/.claude/output-styles"
  "$HOME/.claude/plugins"
  "$HOME/.claude/rules"
  "$HOME/.claude/skills"
  "$HOME/.claude/workflows"
  # codex
  "$HOME/.codex/AGENTS.md"
  "$HOME/.codex/hooks.json"
  "$HOME/.codex/plugins"
  "$HOME/.codex/skills"
  # copilot
  "$HOME/.copilot/agents"
  "$HOME/.copilot/copilot-instructions.md"
  "$HOME/.copilot/hooks"
  "$HOME/.copilot/installed-plugins"
  "$HOME/.copilot/instructions"
  "$HOME/.copilot/prompts"
  "$HOME/.copilot/skills"
)

DENY_LIST=(
  "$HOME/.agents"
  "$HOME/.apm"
  "$HOME/.aws"
  "$HOME/.azure"
  "$HOME/.claude"
  "$HOME/.codex"
  "$HOME/.config"
  "$HOME/.copilot"
  "$HOME/.docker"
  "$HOME/.git-credentials"
  "$HOME/.gnupg"
  "$HOME/.kube"
  "$HOME/.netrc"
  "$HOME/.npmrc"
  "$HOME/.pypirc"
  "$HOME/.ssh"
)

scanned="$normalized"
case "$normalized" in
*..*) ;; # traversal segment present: skip the allow-list, deny-scan the raw blob
*)
  for allowed in "${ALLOW_LIST[@]}"; do
    scanned=${scanned//"$allowed"/}
  done
  ;;
esac

for pattern in "${DENY_LIST[@]}"; do
  if [[ "$scanned" == *"$pattern"* ]]; then
    reason="tool call references a protected path: '$pattern'"
    echo "blocked: $reason" >&2
    # copilot needs a whole JSON response, exiting with an error isn't enough
    # merging all valid agents outputs into one to allow each one to get its expected output values
cat <<EOF
{
  "permissionDecision": "deny",
  "permissionDecisionReason": "$reason",
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "$reason"
  }
}
EOF
    exit 0
  fi
done
