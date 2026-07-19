---
description: Filter outputs from terminal to only give agents what really matters.
title: Filter terminal outputs
---

Some terminal commands are known to provide a lot of outputs.
While this is useful for humans, this pollutes agent context.

Multiple tools exist to counter this context pollution.

{{< tabs >}}

{{< tab name="Rust Token Killer" >}}
A CLI wrapping calls to real commands (arguments are passed through, not all commands are supported).
- **Upstream**: <https://github.com/rtk-ai/rtk>

```sh
mise use -g github:rtk-ai/rtk
# use '--agent' or '--<agent>' to install the RTK instructions
# and hooks for a specific agent
rtk init -g
```
{{< /tab >}}

{{< /tabs >}}
