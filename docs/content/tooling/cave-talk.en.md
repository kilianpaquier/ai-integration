---
description: Cut verbose agent output (chat, docs, commits, code review) down to essentials.
title: Talk like cave humans
---

Agents tend to write a lot, from subagents spawning context and MCP requests/outputs to outputs shown to users, which increases token consumption.

The [**caveman**](https://github.com/JuliusBrussee/caveman) stack counters this by acting at different places within agent runtimes.

{{< tabs >}}

{{< tab name="Caveman" >}}
> [!warning]
> Hooks activation is limited to **Claude Code** by default,
> but a [mirrored plugin](/interoperability/ai-integration/caveman) can be used to broaden agent runtime compatibility.

- **Upstream**: <https://github.com/JuliusBrussee/caveman>
- **What is it**: A skill suite for compressed outputs, primarily for chat output, documentation, commits, code review,
and hooks to automatically activate caveman output mode.

```sh
claude plugin marketplace add kilianpaquier/ai-integration
claude plugin install caveman@one-for-all
```

```sh
apm marketplace add kilianpaquier/ai-integration
apm install caveman@one-for-all -g
```

```sh
apm install kilianpaquier/ai-integration/plugins/caveman -g
```

```sh
npx skills add kilianpaquier/ai-integration
```
{{< /tab >}}

{{< tab name="Cavekit" >}}
- **Upstream**: <https://github.com/JuliusBrussee/cavekit>
- **What is it**: A skill suite to use the [**Spec Driven Development**](/accelerate) framework.

```sh
my-agent plugin marketplace add JuliusBrussee/cavekit
my-agent plugin install ck@cavekit-marketplace
```

```sh
apm marketplace add JuliusBrussee/cavekit
apm install ck@cavekit-marketplace -g
```

```sh
apm install JuliusBrussee/cavekit -g
```

```sh
npx skills add JuliusBrussee/cavekit
```
{{< /tab >}}

{{< tab name="Caveman Code" >}}
> [!note]
> Since it's not a shareable component or pluggeable to mainstream agent runtimes,
> this documentation won't go into details about it.

- **Upstream**: <https://github.com/JuliusBrussee/caveman-code>
- **What is it**: A whole agent runtime to use instead of **Claude Code**, **Copilot**, etc.,
  including the whole **caveman** stack, and using subscriptionss to connect to LLMs.
{{< /tab >}}

{{< tab name="Caveman Shrink" >}}
> [!note]
> Since the integration can be complex in multi-MCP server environments, this documentation won't go into details about it.

- **Upstream**: <https://github.com/JuliusBrussee/caveman/tree/main/src/mcp-servers/caveman-shrink>
- **What is it**: An MCP proxy server to reduce agents' inputs and outputs to and from MCP servers.
{{< /tab >}}

{{< tab name="Cavemem" >}}
> [!note]
> More information about this server in [memory](/tooling/memory).

- **Upstream**: <https://github.com/JuliusBrussee/cavemem>
- **What is it**: An MCP server to store session memories (compressed using **caveman** constraints) and reuse them in subsequent sessions.
{{< /tab >}}

{{< /tabs >}}
