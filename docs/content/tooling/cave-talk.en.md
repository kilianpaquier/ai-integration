---
description: Cut verbose agent output - chat, docs, commits, code review - down to essentials.
title: Talk like cave humans
---

Agents tend to write a lot, from subagents spawning context, MCP requests / outputs to outputs to users, this increase tokens consumption.

To counter this, there's the [caveman](https://github.com/JuliusBrussee/caveman) stack that act at different places within agents runtime.

{{< tabs >}}

{{< tab name="Caveman" >}}
A [skill suite](https://github.com/JuliusBrussee/caveman) for compressed outputs, primarily for chat output, documentation, commits, code review
and [hooks](https://github.com/JuliusBrussee/caveman/tree/main/src/hooks) to automatically activate chat output mode.

```sh
my-agent plugin marketplace add JuliusBrussee/caveman
my-agent plugin install caveman@caveman
```

```sh
npx skills add JuliusBrussee/caveman
```

```sh
apm marketplace add JuliusBrussee/caveman
apm install caveman@caveman
```

*Hook it once and forget it's even on - see [limitation](#caveman-hooks) below.*
{{< /tab >}}

{{< tab name="Cavekit" >}}
A [skill suite](https://github.com/JuliusBrussee/cavekit) to use the [Spec Driven Development (SDD)](/accelerate) framework.

```sh
my-agent plugin marketplace add JuliusBrussee/cavekit
my-agent plugin install ck@cavekit-marketplace
```

```sh
npx skills add JuliusBrussee/cavekit
```

```sh
apm marketplace add JuliusBrussee/cavekit
apm install ck@cavekit-marketplace
```
{{< /tab >}}

{{< tab name="Caveman Code" >}}
A [whole agent](https://github.com/JuliusBrussee/caveman-code) to use instead of **Claude Code**, **Copilot**, etc.
It includes the whole caveman stack and uses subscriptions keys to connect to preferred or subscribed models.

This documentation won't provide more information on this because it is a whole agent
and not just shareable content.
{{< /tab >}}

{{< tab name="Caveman Shrink" >}}
A [MCP proxy server](https://github.com/JuliusBrussee/caveman/tree/main/src/mcp-servers/caveman-shrink) to reduce agents inputs
and outputs to and from MCP servers.

While the idea is good, its use can be quite complex when an user has multiple MCP servers.
The proxy needs to be placed on every MCP server, which mean that every MCP server plugin must be duplicated
with its proxied version.
{{< /tab >}}

{{< tab name="Cavemem" >}}
A [MCP server](https://github.com/JuliusBrussee/cavemem) to store session memories (compressed using caveman constraints)
and reuse them in later sessions.

More information about this server in [memory](/tooling/memory).
{{< /tab >}}

{{< /tabs >}}

## Limitations

### Caveman Hooks

As stated before, caveman talking way can be enabled through hooks.
However those seem to only work with **Claude Code** by default,
as such I'm providing [simili-mirrored hooks](/interoperability/ai-integration/caveman-autostart)
run with node to broaden agents compatibility.
