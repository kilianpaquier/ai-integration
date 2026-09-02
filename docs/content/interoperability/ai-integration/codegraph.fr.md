---
description: Pre-indexed code knowledge graph, auto syncs on code changes, fewer tokens, fewer tool calls, 100% local.
title: CodeGraph
---

- **Upstream**: <https://github.com/colbymchenry/codegraph>
- **Plugin**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/codegraph)
- **Description**: Pre-indexed code knowledge graph, auto syncs on code changes, fewer tokens, fewer tool calls, 100% local.

<!-- docs:start -->

## MCP server

This plugin registers the [codegraph](https://github.com/colbymchenry/codegraph) server with direct binary call `codegraph serve --mcp`.

It indexes a repository into a knowledge graph and exposes tools to explore related symbols,
read one symbol with its callers and callees, and measure the impact of a change.

## Hooks

| Event                             | Output                                                           | Agent Runtimes                      |
| --------------------------------- | ---------------------------------------------------------------- | ----------------------------------- |
| `PreToolUse`, before grep or glob | a reminder to use the `codegraph-mcp` skill                      | Claude Code, Codex                  |
| `PostToolUse`, after grep or glob | the same, where `PreToolUse` carries no context back             | Copilot, Cursor                     |
| `SessionStart`                    | whether the repo is indexed, and to search the graph before grep | Claude Code, Codex, Copilot, Cursor |
| `SubagentStart`                   | the same, for every subagent spawned                             | Claude Code, Codex, Copilot         |

## Skills

| Skill           | Description                                                                                                                                                       |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `codegraph-mcp` | Activated on structural code questions to explore related symbols, call paths and blast radius through the `codegraph_explore` MCP tool rather than a blind grep. |
| `codegraph-cli` | Fallback for querying the knowledge graph through the `codegraph` CLI when the codegraph MCP is unavailable or blocked.                                           |

## Installation

> [!warning]
> The `codegraph` binary and Nodejs are needed in `PATH` environment variable to work,
> see [the installation methods](https://ai.kilianpaquier.dev/tooling/code-indexing).

**Native plugin (recommended)**:
```sh
my-agent plugin install codegraph@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/codegraph -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install codegraph@one-for-all -g
```

<!-- docs:end -->
