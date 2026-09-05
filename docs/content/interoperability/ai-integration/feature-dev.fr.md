---
description: Guided feature development with codebase understanding and architecture focus.
title: Feature Dev
---

- **Upstream**: <https://github.com/anthropics/claude-plugins-official>
- **Plugin**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/feature-dev)
- **Description**: Guided feature development with codebase understanding and architecture focus.

<!-- docs:start -->

## Skills

| Skill         | Upstream                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------- |
| `feature-dev` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/commands/feature-dev.md> |

## Agents

| Agent            | Upstream                                                                                                       |
| ---------------- | -------------------------------------------------------------------------------------------------------------- |
| `code-explorer`  | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-explorer.md>  |
| `code-architect` | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-architect.md> |
| `code-reviewer`  | <https://github.com/anthropics/claude-plugins-official/blob/main/plugins/feature-dev/agents/code-reviewer.md>  |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install feature-dev@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/feature-dev -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install feature-dev@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/feature-dev -g
```

<!-- docs:end -->
