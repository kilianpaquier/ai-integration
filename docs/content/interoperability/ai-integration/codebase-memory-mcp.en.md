---
description: High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.
title: Codebase Memory MCP
---

- **Upstream**: <https://github.com/DeusData/codebase-memory-mcp>
- **Plugin**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/codebase-memory-mcp)
- **Description**: High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.

<!-- docs:start -->

## MCP server

This plugin registers the [codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) server
with direct binary call `codebase-memory-mcp`.

It indexes a repository into a code graph and exposes tools to search symbols, trace callers and callees,
read exact snippets and query the architecture.

## Hooks

Hooks route the agent through the graph (non-blocking). Lifecycle events delegate reminder and index state to `codebase-memory-mcp hook-augment`
while searches (tool events) only provide a simple reminder to use the CLI or MCP to search the codebase.

| Event                             | Output                                                           | Agent Runtimes                      |
| --------------------------------- | ---------------------------------------------------------------- | ----------------------------------- |
| `PreToolUse`, before grep or glob | a reminder to use the `codebase-memory` skill, or the CLI        | Claude Code, Codex, Devin           |
| `PostToolUse`, after grep or glob | the same, where `PreToolUse` carries no context back             | Copilot, Cursor                     |
| `SessionStart`                    | whether the repo is indexed, and to search the graph before grep | Claude Code, Codex, Copilot, Cursor |
| `SubagentStart`                   | the same, for every subagent spawned                             | Claude Code, Codex, Copilot         |
| `pre_llm_call`                    | the same, before every LLM call                                  | Hermes Agent                        |

## Skills

### `codebase-memory`

Activated to answer structural code questions through the knowledge graph: which tool answers which
question, the graph's edge types, Cypher query examples and common pitfalls.

The same tools run as one-shot commands (`codebase-memory-mcp cli <tool>`) when the MCP server is unavailable
or blocked, so no separate CLI skill is needed.

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
