---
description: Make agents remember what they did on other sessions and previous days.
title: Keep past memories
---

When "talking" with agents, there's often information that needs to be remembered between sessions
(e.g. decisions made and why, in-progress task state, small project quirks not yet written down anywhere).

That's why various tools exist to store what's happening, what happened during sessions,
and summarize information back when needed.

{{< tabs >}}

{{< tab name="Cavemem" >}}
> [!warning]Limitations
> Nodejs version must be below or equal to 24 (the [SQLite dependency](https://github.com/WiseLibs/better-sqlite3) is not compatible with 26 yet).

<br/>

> [!warning]Partial installation
> `cavemem install` uses an old and incompatible JSON key for **Claude Code** MCP server settings.

- **Upstream**: <https://github.com/JuliusBrussee/cavemem>
- **What is it**: Hooks to store and an MCP server to retrieve session information in a local SQLite database.

```sh
<npm|pnpm|bun|yarn> install -g node-gyp cavemem
# use '--ide' to install hooks and MCP server for a specific agent
cavemem install
```
{{< /tab >}}

{{< tab name="Mempalace" >}}
- **Upstream**: <https://github.com/MemPalace/mempalace>
- **What is it**: Agents to segment memories, hooks to store, an MCP server or skills to retrieve session information in a local SQLite database.

```sh
my-agent plugin marketplace add MemPalace/mempalace
my-agent plugin install mempalace@mempalace
```

```sh
apm marketplace add MemPalace/mempalace
apm install mempalace@mempalace
```
{{< /tab >}}

{{< tab name="Remember" >}}
- **Upstream**: <https://github.com/Digital-Process-Tools/claude-remember>
- **What is it**: Hooks and a skill to store and retrieve session information in markdown files.

```sh
my-agent plugin marketplace add Digital-Process-Tools/claude-marketplace
my-agent plugin install remember@dpt-plugins
```

```sh
apm marketplace add Digital-Process-Tools/claude-marketplace
apm install remember@dpt-plugins
```
{{< /tab >}}

{{< /tabs >}}
