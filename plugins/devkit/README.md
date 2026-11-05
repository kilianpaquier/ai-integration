# devkit

These skills cover the daily development tasks. They read the code before they write anything, and they check with you wherever a wrong guess would be costly.
You get features built from exploration to review, reviews of verified findings and documentation that stays accurate.

<!-- BEGIN_AII_DOC -->

## Skills

| Skill         | Invocation                  |
| ------------- | --------------------------- |
| `feature`     | `/feature`                  |
| `code-review` | `/code-review` or automatic |
| `doc`         | automatic                   |
| `agents-doc`  | automatic                   |
| `retro`       | `/retro`                    |

### `feature`

Tell it which feature you want and it explores the code, then builds the smallest change that meets the standards the code review checks,
and it stops for your go when the change is large or a question needs your answer.
Ask it to bring an area to the standards instead and it applies the cheap fixes and lists the costly ones.

### `code-review`

Point it at your diff, a merge request, a branch or a path and it reviews the change without touching it,
and since Claude Code has its own built-in `/code-review`, you reach this one through `/devkit:code-review`.
On any agent runtime, it writes each finding as a [Conventional Comment](https://conventionalcomments.org/) backed by a failure scenario, from the most critical to the least critical.

### `doc`

Reach for it when you write or edit a README, a CONTRIBUTING file, a docs site page or code doc comments.
Before placing anything new, it collects the writing rules and reviews the existing text,
and it rewrites long bullets and runs of short sentences into connected ones.

### `agents-doc`

Use it on AGENTS.md, CLAUDE.md and other agent rule files.
It keeps only what an agent couldn't learn from the repository anyway, and it checks every path and command the file names.

### `retro`

Give it a date or a date range and it finds the prompts where you corrected the agent in that period's sessions, traces each one to the rule, skill or config behind it,
and plans the fixes.

## Agents

| Agent           | Upstream                                                                                                      |
| --------------- | ------------------------------------------------------------------------------------------------------------- |
| `code-explorer` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-explorer.md> |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install devkit@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/devkit -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install devkit@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/devkit -g
```

<!-- END_AII_DOCS -->

## Compatibility table

| Agent Runtime   | Manifest                     | Agent configuration                    |
| --------------- | ---------------------------- | -------------------------------------- |
| **APM**         | `apm.yml`                    | `.apm/agents/*.agent.md`               |
| **Antigravity** | `plugin.json`                | `agents/*.agent.md`                    |
| **Claude Code** | `.claude-plugin/plugin.json` | `agents/*.agent.md`                    |
| **Codex**       | `.claude-plugin/plugin.json` | -                                      |
| **Copilot**     | `plugin.json`                | `com.github.copilot/agents/*.agent.md` |
| **Cursor**      | `plugin.json`                | -                                      |
| **Devin**       | `.claude-plugin/plugin.json` | `agents/*.agent.md`                    |

## Limitations

On **Codex** and **Cursor**, the `code-explorer` agent isn't available, so the skills that use it run that step inline.
