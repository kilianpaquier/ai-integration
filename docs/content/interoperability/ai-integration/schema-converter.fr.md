---
description: Une suite de *skills* pour transformer les schémas JSON dans un langage.
title: Schema Converter
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/skills/schema-converter)
- **Description**: Une suite de *skills* pour transformer les schémas JSON dans un langage.

<!-- docs:skill:start -->

## Skills

### `schema-to-go`

Activated to transform a given JSON schema into its Go equivalent.
The skill needs the following arguments when running (it will be asked otherwise):
- Schema path
- Go package path to generate files into
- Go package name for generated files

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install schema-converter@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/skills/schema-converter -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install schema-converter@one-for-all -g
```

**Skills CLI**:

```sh
npx skills add kilianpaquier/ai-integration -g
```

<!-- docs:skill:end -->
