# context7

Up-to-date code documentation for LLMs and AI code editors.

<!-- docs:start -->

## MCP server

This plugin registers the [Context7](https://github.com/upstash/context7) server with direct binary call `context7-mcp`.

It resolves library names to Context7-compatible IDs and fetches current, version-specific documentation
for libraries, frameworks, SDKs and APIs.

## Hooks

| Event                                      | Output                                                 | Agent Runtimes                             |
| ------------------------------------------ | ------------------------------------------------------ | ------------------------------------------ |
| `PreToolUse`, before a web search or fetch | a reminder to try Context7 before the raw web tool     | Claude Code, Codex                         |
| `PostToolUse`, after a web search or fetch | the same reminder, for the next lookup in the session  | Copilot, Cursor                            |
| `SessionStart`                             | a reminder that Context7 is available for library docs | Claude Code, Codex, Copilot, Cursor, Devin |
| `SubagentStart`                            | the same, for every subagent spawned                   | Claude Code, Codex, Copilot                |
| `pre_llm_call`                             | the same, before every LLM call                        | Hermes Agent                               |

## Skills

### `context7-mcp`

Synced as-is from upstream. When to use Context7 over training data or a raw web search for library docs.

### `context7-cli`

Fallback for fetching docs through the `ctx7` CLI when the Context7 MCP is unavailable or blocked.

## Installation

> [!warning]
> Either (or both) `context7-mcp` (MCP allowed) or `ctx7` (MCP denied) binaries are needed in `PATH` environment variable to work.

**Native plugin (recommended)**:
```sh
my-agent plugin install context7@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/context7 -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install context7@one-for-all -g
```

<!-- docs:end -->

## Compatibility table

| Agent Runtime    | Manifest                     | MCP configuration                             | Hook configuration                    |
| ---------------- | ---------------------------- | --------------------------------------------- | ------------------------------------- |
| **Antigravity**  | `plugin.json`                | `mcp_config.json`                             | -                                     |
| **APM**          | `apm.yml`                    | `apm.yml`                                     | `.apm/hooks/hooks.json`               |
| **Claude Code**  | `.claude-plugin/plugin.json` | `mcp.json`                                    | `hooks/claude.json`                   |
| **Codex**        | `.claude-plugin/plugin.json` | `mcp.json`                                    | `hooks/claude.json`                   |
| **Copilot**      | `.plugin/plugin.json`        | `mcp.json`                                    | `com.github.copilot/hooks/hooks.json` |
| **Cursor**       | `.cursor-plugin/plugin.json` | `mcp.json`                                    | `hooks/cursor.json`                   |
| **Devin**        | `.claude-plugin/plugin.json` | `mcp.json`                                    | -                                     |
| **Hermes Agent** | `plugin.yaml`                | manual, `~/.hermes/config.yaml` (not bundled) | `__init__.py`                         |
