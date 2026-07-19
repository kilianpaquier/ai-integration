---
description: Cut verbose agent output (chat, docs, commits, code review) down to essentials.
title: Talk like cave humans
---

Agents tend to write a lot, from subagents spawning context and MCP requests/outputs to outputs shown to users, which increases token consumption.

To counter this, there's the [caveman](https://github.com/JuliusBrussee/caveman) stack that acts at different places within agents' runtime.

{{< tabs >}}

{{< tab name="Caveman" >}}
> [!warning]
> Hooks activation is limited to **Claude Code** by default,
> but [simili-mirrored hooks](/interoperability/ai-integration/caveman) can be used to broaden agent compatibility.

- **Upstream**: <https://github.com/JuliusBrussee/caveman>
- **What is it**: A skill suite for compressed outputs, primarily for chat output, documentation, commits, code review,
and hooks to automatically activate chat output mode.

```sh
my-agent plugin marketplace add JuliusBrussee/caveman
my-agent plugin install caveman@caveman
```

```sh
npx skills add JuliusBrussee/caveman
```

```sh
apm marketplace add JuliusBrussee/caveman
apm install caveman@caveman -g
```

```sh
apm install JuliusBrussee/caveman -g
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
npx skills add JuliusBrussee/cavekit
```

```sh
apm marketplace add JuliusBrussee/cavekit
apm install ck@cavekit-marketplace -g
```

```sh
apm install JuliusBrussee/cavekit -g
```
{{< /tab >}}

{{< tab name="Caveman Code" >}}
> [!note]
> Since it's not a shareable component or pluggeable to mainstream agents,
> this documentation won't go into details about it.

- **Upstream**: <https://github.com/JuliusBrussee/caveman-code>
- **What is it**: A whole agent to use instead of **Claude Code**, **Copilot**, etc.,
  including the whole caveman stack, and using subscription keys to connect to preferred or subscribed models.
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
- **What is it**: An MCP server to store session memories (compressed using caveman constraints) and reuse them in subsequent sessions.
{{< /tab >}}

{{< /tabs >}}
