---
name: codegraph-mcp
description: Use the codegraph_explore MCP tool for structural code discovery (relevant symbols, call paths, blast-radius) instead of blind grep/read. Activates when exploring an unfamiliar codebase, finding what calls or is called by a symbol, or asking how a change would ripple through the code.
---

When the user asks a structural code question, use codegraph's knowledge graph instead of blind grep/read.

## When to Use This Skill

Activate this skill when the user:

- Asks how an area of the codebase works, or where something is handled ("How is authentication handled?")
- Asks what calls or is called by a symbol ("What calls `validateToken`?")
- Asks what would be affected by changing a symbol, or wants a symbol's source read with context

## How to Query the Graph

### Step 1: Ask `codegraph_explore`

By default codegraph's MCP server exposes a single tool, `codegraph_explore`. Call it with a natural-language question or a symbol/file name (`query`). It returns verbatim, line-numbered source, the call paths between the relevant symbols (including dynamic dispatch grep can't follow), and a blast-radius summary, all in one call, no separate lookup step needed.

### Step 2: Narrow with a follow-up query

If the first answer is too broad, call `codegraph_explore` again with a narrower `query` (a specific symbol or file name) instead of switching tools, since it already covers what a "read one node" or "find callers" step would.

## Guidelines

- Only `codegraph_explore` is listed by default, don't assume the others exist. Everything they return already
  arrives inline on `codegraph_explore`, so needing one is usually a sign the query was too narrow.

  | Tool                | Listed | Purpose                                                                                                | CLI equivalent      |
  | ------------------- | ------ | ------------------------------------------------------------------------------------------------------ | ------------------- |
  | `codegraph_explore` | yes    | Relevant symbols' verbatim source, the call paths between them and a blast-radius summary, in one call | `codegraph explore` |
  | `codegraph_node`    | no     | One symbol's source with its callers, or a file read with line numbers                                 | `codegraph node`    |
  | `codegraph_search`  | no     | Search symbols by name                                                                                 | `codegraph query`   |
  | `codegraph_callers` | no     | What calls a function or method                                                                        | `codegraph callers` |
  | `codegraph_callees` | no     | What a function or method calls                                                                        | `codegraph callees` |
  | `codegraph_impact`  | no     | What is affected by changing a symbol                                                                  | `codegraph impact`  |
  | `codegraph_files`   | no     | Project file structure                                                                                 | `codegraph files`   |
  | `codegraph_status`  | no     | Index statistics and staleness                                                                         | `codegraph status`  |

- Pass `projectPath` to query another indexed project, a sub-service in a monorepo or a second repository.
  A path with no index returns guidance to use the built-in tools rather than failing.
- Still use grep/read for literals, configs, and non-code files, codegraph only covers indexed source symbols.
