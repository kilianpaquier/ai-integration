# protected-paths

Stop your agent from accessing unwanted or sensitive directories.

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

## Tests

```sh
node --test tests/protected-paths.test.js
```

## Compatibility table

| Agent Runtime   | Manifest                     | Hook configuration                    |
| --------------- | ---------------------------- | ------------------------------------- |
| **APM**         | `apm.yml`                    | `.apm/hooks/hooks.json`               |
| **Antigravity** | `plugin.json`                | -                                     |
| **Claude Code** | `.claude-plugin/plugin.json` | `hooks/claude.json`                   |
| **Codex**       | `.claude-plugin/plugin.json` | `hooks/claude.json`                   |
| **Copilot**     | `plugin.json`                | `com.github.copilot/hooks/hooks.json` |
| **Cursor**      | `.cursor-plugin/plugin.json` | `hooks/cursor.json`                   |
| **Devin**       | `.claude-plugin/plugin.json` | -                                     |

> [!note]
> **APM** merges `.apm/hooks/hooks.json` into the target agent runtime settings (e.g. `~/.claude/settings.json`)
> and rewrites `${PLUGIN_ROOT}` to the path it deployed the scripts to.

## Limitations

The hook only blocks a path it can read in the call.

- **Antigravity** and **Devin** ship no hook configuration, so no call is inspected there.
- A recursive search that names no path, such as `grep -r x .`, gets past a `**/` entry, while an absolute entry like `~/.ssh` also blocks a search of its parent directories.
- A relative path is followed after `cd`, `pushd` or `-C`, but not after a bare `cd`, so use the full path in the same command.
- Every word of a command counts as a possible path, so with `**/.env` listed, `git commit -m "ignore .env"` is denied until you reword the message.
