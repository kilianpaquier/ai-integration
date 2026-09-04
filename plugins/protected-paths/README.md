# protected-paths

Stop your agent from accessing unwanted or sensitive directories.

<!-- docs:start -->

## Hooks

| Event                                               | Output                                                | Agent Runtimes                      |
| --------------------------------------------------- | ----------------------------------------------------- | ----------------------------------- |
| `PreToolUse`, shell/read/write/edit/glob/grep calls | blocks the call when it touches a protected directory | Claude Code, Codex, Copilot, Cursor |

Protected directories: `~/.agents`, `~/.apm`, `~/.aws`, `~/.azure`, `~/.claude`, `~/.codex`, `~/.config`, `~/.copilot`, `~/.docker`,
`~/.git-credentials`, `~/.gnupg`, `~/.kube`, `~/.netrc`, `~/.npmrc`, `~/.pypirc`, `~/.ssh`.

An allow-list carves out specific subpaths under `~/.agents`, `~/.apm`, `~/.claude`, `~/.codex`, `~/.config`, and `~/.copilot`,
which are otherwise fully denied.

The hook also catches recursive tools (`grep -r`, `find`, `tar`, `rsync`, `ls -R`, ...)
and bare references like `cd ~` that could reach a protected directory without naming it directly.

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

> [!warning]No protection on Antigravity or Devin
> Antigravity and Devin ship no hook configuration, so no tool call is inspected there, none of the protections below apply on those runtimes.

> [!warning]Relative paths after a `cd` are not resolved
> A relative path used after a `cd` earlier in the same command is not resolved against that new directory.
