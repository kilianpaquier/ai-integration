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

| Agent Runtime   | Manifest                     |
| --------------- | ---------------------------- |
| **APM**         | `apm.yml`                    |
| **Antigravity** | `plugin.json`                |
| **Claude Code** | `.claude-plugin/plugin.json` |
| **Codex**       | `.claude-plugin/plugin.json` |
| **Copilot**     | `plugin.json`                |
| **Cursor**      | `plugin.json`                |
| **Devin**       | `.claude-plugin/plugin.json` |
