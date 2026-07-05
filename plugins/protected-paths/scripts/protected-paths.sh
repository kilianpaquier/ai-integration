#!/bin/bash

set -e

INPUT=$(cat)
file_path=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
command=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

PROTECTED_PATTERNS=(
  "$HOME/.aws"
  "$HOME/.azure"
  "$HOME/.claude"
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

normalized_file_path=$(echo "$file_path" | sed "s|~|$HOME|g; s|\$HOME|$HOME|g")
normalized_command=$(echo "$command" | sed "s|~|$HOME|g; s|\$HOME|$HOME|g")

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$normalized_file_path" == *"$pattern"* ]]; then
    echo "blocked: $normalized_file_path matches protected pattern '$pattern'" >&2
    exit 2
  fi
  if [[ "$normalized_command" == *"$pattern"* ]]; then
    echo "blocked: command reads protected pattern '$pattern'" >&2
    exit 2
  fi
done
