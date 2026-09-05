---
description: Bloquez les commandes shell et git destructrices avant leur exécution.
title: DCG
---

- **Upstream**: <https://github.com/Dicklesworthstone/destructive_command_guard>
- **Plugin**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/dcg)
- **Description**: Bloquez les commandes shell et git destructrices avant leur exécution.

<!-- docs:start -->

## Hooks

| Event        | Output                                                                                                                  |
| ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `PreToolUse` | blocks the command when [`dcg`](https://github.com/Dicklesworthstone/destructive_command_guard) flags it as destructive |

> [!warning]
> `dcg` must already be installed and available in `PATH`.
> This plugin only wires the hook, it does not install or manage the `dcg` binary.

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin install dcg@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/dcg -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install dcg@one-for-all -g
```

<!-- docs:end -->
