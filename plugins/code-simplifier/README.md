# code-simplifier

Simplify and refine recently modified code for clarity, consistency, and maintainability
without changing its behavior.

<!-- docs:start -->

## Skills

| Skill             | Upstream                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------------------- |
| `code-simplifier` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/code-simplifier/agents/code-simplifier.md> |

## Agents

| Agent             | Upstream                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------------------- |
| `code-simplifier` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/code-simplifier/agents/code-simplifier.md> |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install code-simplifier@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/code-simplifier -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install code-simplifier@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/code-simplifier -g
```

<!-- docs:end -->

## Compatibility table

| Agent Runtime   | Manifest                     | Agent configuration                                  |
| --------------- | ---------------------------- | ---------------------------------------------------- |
| **APM**         | `apm.yml`                    | `.apm/agents/code-simplifier.agent.md`               |
| **Antigravity** | `plugin.json`                | `agents/code-simplifier.agent.md`                    |
| **Claude Code** | `.claude-plugin/plugin.json` | `agents/code-simplifier.agent.md`                    |
| **Codex**       | `.claude-plugin/plugin.json` | -                                                    |
| **Copilot**     | `plugin.json`                | `com.github.copilot/agents/code-simplifier.agent.md` |
| **Cursor**      | `plugin.json`                | -                                                    |
| **Devin**       | `.claude-plugin/plugin.json` | `agents/code-simplifier.agent.md`                    |

## Limitations

> [!warning]No agent on Codex or Cursor
> Codex and Cursor have no plugin agent mode, so `code-simplifier` is unavailable there as a
> dedicated agent; only the `code-simplifier` skill can drive it on those runtimes.
