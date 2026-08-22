# protected-paths

Stop your agent from accessing unwanted or sensitive directories.

<!-- docs:start -->

## Hooks

This plugin registers a `PreToolUse` hook that inspects every tool call and blocks any that touch a
protected directory: `~/.agents`, `~/.apm`, `~/.aws`, `~/.azure`, `~/.claude`, `~/.codex`, `~/.config`, `~/.copilot`, `~/.docker`,
`~/.git-credentials`, `~/.gnupg`, `~/.kube`, `~/.netrc`, `~/.npmrc`, `~/.pypirc`, `~/.ssh`.

An allow-list carves out specific subpaths needed for plugins and instructions to keep working under
`~/.apm`, `~/.claude`, `~/.codex`, and `~/.copilot`, which are otherwise fully denied.

The hook also catches recursive tools (`grep -r`, `find`, `tar`, `rsync`, `ls -R`, ...) and bare
references like `cd ~` that could reach a protected directory without naming it directly.

A blocked call prints an explanatory message and denies the tool call across **Claude Code**, **Codex**, **Copilot**, **Cursor** and **Hermes Agent**.

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

## Tests

```sh
node --test tests/protected-paths.test.js
```

## Compatibility table

| Agent Runtime    | Manifest                     | Hook configuration                    |
| ---------------- | ---------------------------- | ------------------------------------- |
| **APM**          | `apm.yml`                    | `.apm/hooks/hooks.json`               |
| **Claude Code**  | `.claude-plugin/plugin.json` | `hooks/claude.json`                   |
| **Codex**        | `.claude-plugin/plugin.json` | `hooks/claude.json`                   |
| **Copilot**      | `.plugin/plugin.json`        | `com.github.copilot/hooks/hooks.json` |
| **Cursor**       | `.cursor-plugin/plugin.json` | `hooks/cursor.json`                   |
| **Hermes Agent** | `plugin.yaml`                | `__init__.py`                         |

> [!note]
> **APM** merges `.apm/hooks/hooks.json` into the target agent runtime settings (e.g. `~/.claude/settings.json`)
> and rewrites `${PLUGIN_ROOT}` to the path it deployed the scripts to.
