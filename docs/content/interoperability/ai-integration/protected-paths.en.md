---
description: Stop your agent from accessing unwanted or sensitive directories.
title: Protected Paths
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/protected-paths)
- **Description**: Stop your agent from accessing unwanted or sensitive directories.

<!-- docs:start -->

## Hooks

| Event                                               | Output                                                | Agent Runtimes                      |
| --------------------------------------------------- | ----------------------------------------------------- | ----------------------------------- |
| `PreToolUse`, shell/read/write/edit/glob/grep calls | blocks the call when it touches a protected directory | Claude Code, Codex, Copilot, Cursor |

Protected and allowed directories come from `~/.config/protected-paths/config.json`,
a `denylist`/`allowlist` pair of path arrays (`~`, `$HOME`, and `${HOME}` are expanded):

```json
{
    "denylist": ["~/.ssh", "~/.aws"],
    "allowlist": ["~/.ssh/config"]
}
```

The hook also catches recursive tools (`grep -r`, `find`, `tar`, `rsync`, `ls -R`, ...)
and bare references like `cd ~` that could reach a denylisted directory without naming it directly.

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
