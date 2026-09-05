# feature-dev

A structured 7-phase workflow for feature development:
codebase exploration, clarifying questions, architecture design, implementation, and quality review.

<!-- docs:start -->

## Skills

| Skill         | Upstream                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------- |
| `feature-dev` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/commands/feature-dev.md> |

## Agents

| Agent            | Upstream                                                                                                       |
| ---------------- | -------------------------------------------------------------------------------------------------------------- |
| `code-explorer`  | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-explorer.md>  |
| `code-architect` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-architect.md> |
| `code-reviewer`  | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-reviewer.md>  |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install feature-dev@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/feature-dev -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install feature-dev@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/feature-dev -g
```

<!-- docs:end -->

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

> [!warning]No agents on Codex or Cursor
> Codex and Cursor have no plugin agent mode, so `code-explorer`, `code-architect`, and
> `code-reviewer` are unavailable there; only the `feature-dev` skill can drive the workflow.
