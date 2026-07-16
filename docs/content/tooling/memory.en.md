---
description: Make agents remember what they did on other sessions and previous days.
title: Keep past memories
---

When "talking" with agents, there's sometime (frequently) information needed to be remembered between sessions.

Of course a global instructions for a given repository is better because the whole team can take advantage of it,
but sometime those are missing little things for the agents to understand correctly projects and what's asked of them within a session.

That's why it exists various tools to store what's happening, what happened during sessions
and capable of summarizing information back when needed.

{{< tabs >}}

{{< tab name="Cavemem" >}}
A [MCP server](https://github.com/JuliusBrussee/cavemem) to search previous sessions.
Sessions information are compressed and stored with the help of hooks on a local SQLite database.

Complete the [caveman](/tooling/cave-talk) stack.

**Limitations**:
- NodeJS must be <= 24 (the [SQLite dependency](https://github.com/WiseLibs/better-sqlite3) is not compatible with 26 yet).
- `cavemem install` uses an old and uncompatible JSON key for **Claude Code** MCP server settings
  (recommendation is to install an additional plugin providing the MCP server only).

CLI installation:

```sh
<npm|pnpm|bun|yarn> install -g node-gyp cavemem
# use '--ide' to install hooks and MCP server for a specific agent
cavemem install
```

Pre-defined MCP server plugin:

```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-integration
my-agent plugin install cavemem@one-for-all
```
{{< /tab >}}

{{< tab name="Mempalace" >}}
A [MCP server](https://github.com/MemPalace/mempalace) capable of segmenting memories.

By far the most advanced memory-based tool, it offers multiple features around its memory palace
(e.g. wings, diaries, old sessions indexing, projects mining, remote run for teams to share session memories).
It's also based on hooks to save current sessions.

Pre-defined all-in-one (MCP server, skills, hooks) plugin:

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
A simple [**Claude Code** plugin](https://github.com/Digital-Process-Tools/claude-remember)
(compatibility with additional agents to be verified) storing sessions memories on markdown files (onelines, really simple).
Hooks take care of automatically saving sessions memories and restoring on new sessions.

**Limitations**:
- Sessions memories are really short and scoped to the concerned repository, no transversal possible

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
