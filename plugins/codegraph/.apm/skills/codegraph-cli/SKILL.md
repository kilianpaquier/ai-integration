---
allowed-tools:
  - Bash(codegraph affected:*)
  - Bash(codegraph callees:*)
  - Bash(codegraph callers:*)
  - Bash(codegraph explore:*)
  - Bash(codegraph files:*)
  - Bash(codegraph impact:*)
  - Bash(codegraph init:*)
  - Bash(codegraph node:*)
  - Bash(codegraph query:*)
  - Bash(codegraph status:*)
  - Bash(codegraph sync:*)
  - shell(codegraph affected:*)
  - shell(codegraph callees:*)
  - shell(codegraph callers:*)
  - shell(codegraph explore:*)
  - shell(codegraph files:*)
  - shell(codegraph impact:*)
  - shell(codegraph init:*)
  - shell(codegraph node:*)
  - shell(codegraph query:*)
  - shell(codegraph status:*)
  - shell(codegraph sync:*)
description: |
  Query the codegraph knowledge graph with the codegraph CLI for structural code questions:
  what calls a symbol, what it calls, its source, and the blast radius of changing it.
  Use whenever the codegraph MCP tools are unavailable or blocked.
  Requires codegraph in PATH and an indexed repository, and covers indexed source symbols only,
  not literals, configs or non-code files.
disable-model-invocation: false
license: MIT
name: codegraph-cli
user-invocable: true
---

# codegraph CLI (code intelligence)

Fallback for querying the codegraph knowledge graph via the `codegraph` CLI when the MCP tools can't be used.
Requires `codegraph` in `PATH` and the repository already indexed (`codegraph init --index`, or `codegraph sync` if stale).

See [references/cli.md](references/cli.md) for the full command reference.
