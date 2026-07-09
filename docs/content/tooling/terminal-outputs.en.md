---
description: Filter outputs from terminal to only give agents what really mean.
title: Filter terminal outputs
---

Some terminal commands are known to provide a lot of outputs.
While this is useful for humans, this pollutes agents contextes.

Multiple tools exist to counter this context pollution.

{{< tabs >}}

{{< tab name="Rust Token Killer" >}}
A [simple CLI](https://github.com/rtk-ai/rtk) that wraps calls to real commands (passthrough arguments).
Easy to install and direct results.

```sh
mise use -g github:rtk-ai/rtk
# use '--agent' or '--<agent>' to install the RTK instructions
# and hooks for a specific agent
rtk init -g
```
{{< /tab >}}

{{< /tabs >}}
