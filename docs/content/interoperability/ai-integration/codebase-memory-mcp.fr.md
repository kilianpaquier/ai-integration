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

Hooks route the agent through the graph, all of them delegating to `codebase-memory-mcp hook-augment` (non-blocking).

| Event                             | Output                                                           | Agents                      |
| --------------------------------- | ---------------------------------------------------------------- | --------------------------- |
| `PreToolUse`, before grep or glob | the graph symbols matching what it searched                      | Claude Code, Codex          |
| `PostToolUse`, after a file read  | the parts of that file the graph does not know                   | Claude Code, Codex          |
| `SessionStart`                    | whether the repo is indexed, and to search the graph before grep | Claude Code, Codex, Copilot |
| `SubagentStart`                   | the same, for every subagent spawned                             | Claude Code, Codex, Copilot |

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
