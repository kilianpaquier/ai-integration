---
description: Filter outputs from terminal to only give agents what really matters.
title: Filter terminal outputs
---

Some terminal commands are known to provide a lot of outputs.
While this is useful for humans, this pollutes agent context.

Multiple tools exist to counter this context pollution.

{{< tabs >}}

{{< tab name="JFrog Boost" >}}
- **Upstream**: <https://github.com/jfrog/boost>
- **Description**: A CLI rewriting agent commands to compress noisy stdout (and MCP JSON tool responses) before they reach context.

```sh
mise use -g 'github:jfrog/boost@latest'
# or
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

```sh
boost init --accept-terms
```
{{< /tab >}}

{{< tab name="Rust Token Killer" >}}
> [!note]
> Not all commands are supported.

- **Upstream**: <https://github.com/rtk-ai/rtk>
- **Description**: A CLI wrapping calls to real commands (arguments are passed through).

```sh
brew install rtk
```

```sh
mise use -g rtk@latest
# use '--agent' or '--<agent>' to install the RTK instructions
# and hooks for a specific agent runtime
rtk init -g
```
{{< /tab >}}

{{< /tabs >}}
