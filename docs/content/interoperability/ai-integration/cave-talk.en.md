---
description: Ultra-compressed communication mode. Cuts output tokens while keeping full technical accuracy.
title: Cave Talk
---

- **Upstream**: <https://github.com/JuliusBrussee/caveman>
- **Plugin**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/cave-talk)
- **Description**: Ultra-compressed communication mode. Cuts output tokens while keeping full technical accuracy.

<!-- docs:start -->

## Hooks

| Event              | Script                        | Output                                               |
| ------------------ | ----------------------------- | ---------------------------------------------------- |
| `SessionStart`     | `scripts/caveman-activate.js` | the session level body, inlined into the script      |
| `UserPromptSubmit` | `scripts/caveman-mode.js`     | nothing, it saves the mode change the prompt carries |
| `UserPromptSubmit` | `scripts/caveman-activate.js` | a hint line naming the mode the session runs at      |

**Caveman** supports the following levels: `caveman`, `ultracave`, `megacave`, or `off` to disable.
Within a session, `/caveman <level>` switches the level and `stop caveman` (or `normal mode`) turns it off.

By default the level for all session is `caveman` (`manual` to start inactive), but it can be changed with the following order precedence:
- the `CAVEMAN_DEFAULT_MODE` environment variable
- a `.caveman/config.json` or `.caveman.json` within a repository with `defaultMode` property
- a `~/.config/caveman/config.json` (or under `$XDG_CONFIG_HOME/caveman/config.json`) with `defaultMode` property

## Skills

A subset of upstream skills is vendored as-is.
The `caveman`, `ultracave` and `megacave` skills need no manual invocation, the `SessionStart` hook already inlines the session level body.

| Skill             | Upstream                                                                             |
| ----------------- | ------------------------------------------------------------------------------------ |
| `caveman`         | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md>         |
| `caveman-commit`  | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman-commit/SKILL.md>  |
| `caveman-explore` | <https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman-explore/SKILL.md> |
| `megacave`        | <https://github.com/JuliusBrussee/caveman/blob/main/skills/megacave/SKILL.md>        |
| `ultracave`       | <https://github.com/JuliusBrussee/caveman/blob/main/skills/ultracave/SKILL.md>       |

## Installation

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Native plugin (recommended)**:
```sh
my-agent plugin install cave-talk@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/cave-talk -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install cave-talk@one-for-all -g
```

<!-- docs:end -->
