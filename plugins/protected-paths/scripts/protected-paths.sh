#!/bin/bash

set -e

INPUT=$(cat)
normalized=$(printf '%s' "$INPUT" | sed "s|~|$HOME|g; s|\$HOME|$HOME|g")

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

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$normalized" == *"$pattern"* ]]; then
    echo "blocked: tool call references a protected path: '$pattern'" >&2
    exit 2
  fi
done
