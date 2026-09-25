---
description: Codebase indexing through graph-based database makes navigation faster.
title: Index your codebases
---

Codebases might sometimes hold a lot of files, with various structures, interactions and architectures.
When an agent searches something inside of a codebase,
its primary action is to either read all files it needs when searching (blindly)
or run commands (e.g. `grep`)s to filter files based on their content.

It's even more visible when searching code dependencies, *what calls this function*, *what uses this class or struct*, etc.

To fix this behavior, codebases can be indexed through graph-based databases instead.
By doing this, an agent can use an MCP server, a CLI, or a skill
to easily retrieve all interactions regarding a class, a function, a method, etc. with a single request.

And it's not just language-based codebases that can be indexed:
it can also be used for Helm charts, Terraform modules, markdown references, etc. (still depends on each tool's feature set).

{{< tabs >}}

{{< tab name="BoostGraph" >}}
> [!warning]
> Present in Boost documentation but absent from the CLI (as of 2026-09-25) and from the locally deployed UI

- **Upstream**: <https://github.com/jfrog/boost>
- **Indexing**: through the CLI or automatically via a background hook on session start
- **Navigation**: through the MCP server

Install:

```sh
mise use -g 'github:jfrog/boost@latest'
# or
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

```sh
boost init --accept-terms
```

Usage:

```sh
boost graph init # within repositories to index on demand
```
{{< /tab >}}

{{< tab name="Codebase Memory MCP" >}}
- **Upstream**: <https://github.com/DeusData/codebase-memory-mcp>
- **Indexing**: through the MCP server or the CLI
- **Navigation**: through the MCP server or the CLI
- **Plugin**: [/interoperability/ai-integration/codebase-memory-mcp](/interoperability/ai-integration/codebase-memory-mcp)

CLI installation:

```sh
mise use -g 'github:DeusData/codebase-memory-mcp@latest'
# or
<npm|pnpm|bun> install -g codebase-memory-mcp
```

Usage:

```sh
my-agent plugin install codebase-memory-mcp@one-for-all
# or
codebase-memory-mcp install
```
{{< /tab >}}

{{< tab name="Codegraph" >}}
- **Upstream**: <https://github.com/colbymchenry/codegraph>
- **Indexing**: through the CLI
- **Navigation**: through the MCP server or the CLI
- **Plugin**: [/interoperability/ai-integration/codegraph](/interoperability/ai-integration/codegraph)

CLI installation:

```sh
mise use -g 'github:colbymchenry/codegraph@latest'
```

Usage:

```sh
my-agent plugin install codegraph@one-for-all
# or
codegraph install
# then
codegraph init --index # within repositories to index
```

{{< /tab >}}

{{< tab name="Graphify" >}}
- **Upstream**: <https://github.com/Graphify-Labs/graphify>
- **Indexing**: through the skill or the CLI
- **Navigation**: through the MCP server, the skill, or the CLI

```sh
uv tool install graphifyy
graphify install
```
{{< /tab >}}

{{< /tabs >}}
