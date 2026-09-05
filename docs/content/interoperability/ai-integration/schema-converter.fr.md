---
description: Une suite de *skills* pour transformer les schémas JSON dans un langage.
title: Schema Converter
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/schema-converter)
- **Description**: Une suite de *skills* pour transformer les schémas JSON dans un langage.

<!-- docs:start -->

## Skills

| Skill          | Description                                                |
| -------------- | ---------------------------------------------------------- |
| `schema-to-go` | A skill that converts JSON Schema to Go struct definitions |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install schema-converter@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/schema-converter -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install schema-converter@one-for-all -g
```

**Skills CLI**:

```sh
npx skills add kilianpaquier/ai-integration/plugins/schema-converter -g
```

<!-- docs:end -->
