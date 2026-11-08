---
description: Protégez l'accès aux dossiers sensibles aux agents.
title: Protected Paths
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/protected-paths)
- **Description**: Protégez l'accès aux dossiers sensibles aux agents.

<!-- BEGIN_AII_DOC -->

## Hooks

| Event                                               | Output                                                | Agent Runtimes                      |
| --------------------------------------------------- | ----------------------------------------------------- | ----------------------------------- |
| `PreToolUse`, shell/read/write/edit/glob/grep calls | blocks the call when it touches a protected directory | Claude Code, Codex, Copilot, Cursor |

Protected paths come from `~/.config/protected-paths/config.json`, a `denylist`/`allowlist` pair:

```json
{
    "denylist": ["~/.ssh", "**/.env", "**/.git/hooks"],
    "allowlist": ["~/.ssh/config"]
}
```

- A path such as `~/.ssh` protects that directory and everything in it.
- A path starting with `**/` protects it in any directory (`**/.env`).
- Use `*` and `?` inside the names of any path (`~/.config/*/secrets`, `**/.env.*.local`).
- An allowlist entry lifts a match from the denylist.
- A missing config file allows every call, an unreadable or malformed one blocks every call.

Commands that reach a protected directory without naming it, such as `grep -r` or `cd ~`, are blocked too.

## Installation

> [!warning]
> Nodejs 24 or later is needed in `PATH` environment variable to work.

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

<!-- END_AII_DOCS -->
