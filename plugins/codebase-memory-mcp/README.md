# codebase-memory-mcp

High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.

<!-- docs:start -->

## MCP server

This plugin registers the [codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) server
with direct binary call `codebase-memory-mcp`.

It indexes a repository into a code graph and exposes tools to search symbols, trace callers and callees,
read exact snippets and query the architecture.

## Hooks

Hooks route the agent through the graph, all of them delegating to `codebase-memory-mcp hook-augment` (non-blocking).

| Event                             | Output                                                           | Agent Runtimes                                    |
| --------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------- |
| `PreToolUse`, before grep or glob | the graph symbols matching what it searched                      | Claude Code, Devin                                |
| `SessionStart`                    | whether the repo is indexed, and to search the graph before grep | Claude Code, Codex, Copilot, Cursor               |
| `SubagentStart`                   | the same, for every subagent spawned                             | Claude Code, Codex, Copilot                       |
| `pre_llm_call`                    | the same, before every LLM call                                  | Hermes Agent                                      |

## Skills

### `codebase-memory`

Activated to answer structural code questions through the knowledge graph: which tool answers which
question, the graph's edge types, Cypher query examples and common pitfalls.

## Installation

> [!warning]
> The `codebase-memory-mcp` binary is needed in `PATH` environment variable to work,
> see [the installation methods](https://ai.kilianpaquier.dev/tooling/code-indexing).

**Native plugin (recommended)**:
```sh
my-agent plugin install codebase-memory-mcp@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/codebase-memory-mcp -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install codebase-memory-mcp@one-for-all -g
```

<!-- docs:end -->

## Compatibility table

| Agent Runtime    | Manifest                     | MCP configuration                             | Hook configuration                    |
| ---------------- | ---------------------------- | --------------------------------------------- | ------------------------------------- |
| **Antigravity**  | `plugin.json`                | `mcp_config.json`                             | -                                     |
| **APM**          | `apm.yml`                    | `apm.yml`                                     | `.apm/hooks/hooks.json`               |
| **Claude Code**  | `.claude-plugin/plugin.json` | `mcp.json`                                    | `hooks/claude.json`                   |
| **Codex**        | `.codex-plugin/plugin.json`  | `mcp.json`                                    | `hooks/codex.json`                    |
| **Copilot**      | `.plugin/plugin.json`        | `mcp.json`                                    | `com.github.copilot/hooks/hooks.json` |
| **Cursor**       | `.cursor-plugin/plugin.json` | `mcp.json`                                    | `hooks/cursor.json`                   |
| **Devin**        | `.claude-plugin/plugin.json` | `mcp.json`                                    | -                                     |
| **Hermes Agent** | `plugin.yaml`                | manual, `~/.hermes/config.yaml` (not bundled) | `__init__.py`                         |
