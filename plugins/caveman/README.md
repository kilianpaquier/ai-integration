# caveman

Ultra-compressed communication mode. Cuts output tokens while keeping full technical accuracy.

<!-- docs:start -->

## Hooks

| Event              | Script                        | Output                                               |
| ------------------ | ----------------------------- | ---------------------------------------------------- |
| `SessionStart`     | `scripts/caveman-activate.js` | the `caveman` skill body, inlined into the script    |
| `UserPromptSubmit` | `scripts/caveman-mode.js`     | nothing, it saves the mode change the prompt carries |
| `UserPromptSubmit` | `scripts/caveman-activate.js` | a hint line naming the mode the session runs at      |

**Caveman** supports the following levels: `lite`, `full`, `ultra`, `wenyan-lite`, `wenyan-full`, `wenyan-ultra`, or `off` to disable.
Within a session, `/caveman <level>` switches the level and `stop caveman` (or `normal mode`) turns it off.

By default the level for all session is `full`, but it can be changed with the following order precedence:
- the `CAVEMAN_DEFAULT_MODE` environment variable
- a `.caveman/config.json` or `.caveman.json` within a repository with `defaultMode` property
- a `~/.config/caveman/config.json` (or under `$XDG_CONFIG_HOME/caveman/config.json`) with `defaultMode` property

## Skills

A subset of upstream skills is vendored as-is.
The `caveman` skill itself needs no manual invocation, the `SessionStart` hook already inlines its body.

| Skill             | Upstream                                                                             |
| ----------------- | ------------------------------------------------------------------------------------ |
| `caveman`         | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md>         |
| `caveman-commit`  | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman-commit/SKILL.md>  |
| `caveman-explore` | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman-explore/SKILL.md> |

## Installation

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Native plugin (recommended)**:
```sh
my-agent plugin install caveman@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/caveman -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install caveman@one-for-all -g
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

## Limitations

> [!warning]Mode hint not re-asserted on Copilot or Cursor
> **Copilot** and **Cursor** accept context back on `SessionStart` only,
> so the `UserPromptSubmit` hint naming the active mode never registers there: it would spawn a process per prompt
> and discard what it prints.
> The mode still persists through `caveman-mode.js`, it just isn't re-asserted mid-session.
