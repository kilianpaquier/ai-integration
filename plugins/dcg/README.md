# dcg

Block destructive shell and git commands before they run.

<!-- docs:start -->

## Hooks

| Event        | Output                                                                                                                  |
| ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `PreToolUse` | blocks the command when [`dcg`](https://github.com/Dicklesworthstone/destructive_command_guard) flags it as destructive |

> [!warning]
> `dcg` must already be installed and available in `PATH`.
> This plugin only wires the hook, it does not install or manage the `dcg` binary.

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin install dcg@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/dcg -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install dcg@one-for-all -g
```

<!-- docs:end -->

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
