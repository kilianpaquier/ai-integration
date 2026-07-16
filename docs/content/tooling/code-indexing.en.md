---
description: Codebase indexing through graph-based database helps navigating them faster.
title: Index your codebases
---

Codebases might sometime be a lot of files, with various structures, interactions and architectures.
When an agent searches something inside of a codebase,
its primarily action is to either read all files it needs when searching (blindly)
or running commands to filter files based on their content.

It's even more visible when searching code dependencies, *who call this function*, *who uses this class or struct*, etc.

To fix this behavior, codebases can be indexed through graph-based databases instead.
By doing this, an agent can use an MCP server, a CLI, a skill
to easily retrieve through one request all interactions regarding a class, a function, a method, etc.

And since recently, it's not just languages-based codebases that can be indexed,
it can also be used for Helm charts, Terraform modules, markdown references, etc. (still depends on the features the used tool offers).

{{< tabs >}}

{{< tab name="Codebase Memory MCP" >}}
A [CLI and MCP server](https://github.com/DeusData/codebase-memory-mcp) indexing a codebase locally and exposing symbols,
references and call graphs through the MCP server.

CLI installation:

```sh
mise use -g github:DeusData/codebase-memory-mcp
codebase-memory-mcp install
```

Pre-defined MCP server plugin:

```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-integration
my-agent plugin install codebase-memory-mcp@one-for-all
```

```sh
apm marketplace add https://gitlab.com/kilianpaquier/ai-integration
apm install codebase-memory-mcp@one-for-all
```
{{< /tab >}}

{{< tab name="Codegraph" >}}
A [CLI and MCP server](https://github.com/colbymchenry/codegraph) indexing a codebase into a local knowledge graph,
exposed through the MCP server.

CLI installation:

```sh
mise use -g github:colbymchenry/codegraph
codegraph install
codegraph init --index # in the repository
```

Pre-defined MCP server plugin:

```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-integration
my-agent plugin install codegraph@one-for-all
```

```sh
apm marketplace add https://gitlab.com/kilianpaquier/ai-integration
apm install codegraph@one-for-all
```
{{< /tab >}}

{{< /tabs >}}
