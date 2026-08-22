# schema-converter

A skill suite to transform JSON schemas into their language equivalents.

<!-- docs:start -->

## Skills

### `schema-to-go`

Activated to transform a given JSON schema into its Go equivalent.
The skill needs the following arguments when running (it will be asked otherwise):
- Schema path
- Go package path to generate files into
- Go package name for generated files

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install schema-converter@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/schema-converter -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install schema-converter@one-for-all -g
```

**Skills CLI**:

```sh
npx skills add kilianpaquier/ai-integration -g
```

<!-- docs:end -->

## Compatibility table

| Agent                | Manifest                     | Skills    |
| -------------------- | ---------------------------- | --------- |
| **APM**              | `apm.yml`                    | `skills/` |
| **Claude Code**      | `.claude-plugin/plugin.json` | `skills/` |
| **Codex**            | `.claude-plugin/plugin.json` | `skills/` |
| **Copilot**          | `plugin.json`                | `skills/` |
| **Cursor**           | `plugin.json`                | `skills/` |

> [!note]
> **APM** copies `skills/` to the agent directory
> (`~/.claude/skills/` for **Claude Code**, `~/.agents/skills/`, etc.).
