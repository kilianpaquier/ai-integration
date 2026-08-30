---
description: Protégez l'accès aux dossiers sensibles aux agents.
title: Protected Paths
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/protected-paths)
- **Description**: Protégez l'accès aux dossiers sensibles aux agents.

<!-- docs:start -->

## Hooks

This plugin registers a `PreToolUse` hook that inspects every tool call and blocks any that touch a
protected directory: `~/.agents`, `~/.apm`, `~/.aws`, `~/.azure`, `~/.claude`, `~/.codex`, `~/.config`, `~/.copilot`, `~/.docker`,
`~/.git-credentials`, `~/.gnupg`, `~/.kube`, `~/.netrc`, `~/.npmrc`, `~/.pypirc`, `~/.ssh`.

An allow-list carves out specific subpaths needed for plugins and instructions to keep working under
`~/.agents`, `~/.apm`, `~/.claude`, `~/.codex`, `~/.config`, and `~/.copilot`, which are otherwise fully denied.

The hook also catches recursive tools (`grep -r`, `find`, `tar`, `rsync`, `ls -R`, ...) and bare
references like `cd ~` that could reach a protected directory without naming it directly.

> [!warning]
> A relative path used after a `cd` earlier in the same command is not resolved against that new directory.

## Installation

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Native plugin (recommended)**:
```sh
my-agent plugin install protected-paths@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/protected-paths -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install protected-paths@one-for-all -g
```

<!-- docs:end -->
