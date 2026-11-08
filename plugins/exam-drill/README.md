# exam-drill

Endless certification drilling with real exam-format questions built from official documentation.

<!-- BEGIN_AII_DOC -->

## Skills

| Skill        | Description                                                                           |
| ------------ | ------------------------------------------------------------------------------------- |
| `exam-drill` | Drills one certification, one question per turn, from documentation read that session |

The skill will use the current session's model and effort.
An underdimensioned model or effort will need confirmation before starting the drill because it could produce less accurate
or realistic questions.

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install exam-drill@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/exam-drill -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install exam-drill@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/exam-drill -g
```

<!-- END_AII_DOCS -->

## Compatibility table

| Agent Runtime   | Manifest                     |
| --------------- | ---------------------------- |
| **APM**         | `apm.yml`                    |
| **Antigravity** | `plugin.json`                |
| **Claude Code** | `.claude-plugin/plugin.json` |
| **Codex**       | `.claude-plugin/plugin.json` |
| **Copilot**     | `plugin.json`                |
| **Cursor**      | `plugin.json`                |
| **Devin**       | `.claude-plugin/plugin.json` |

## Limitations

A long drill grows the session until it compacts, so questions can repeat after a very long run.
