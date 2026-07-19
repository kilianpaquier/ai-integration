---
description: A simple plugin to convert JSON schemas into their language equivalents.
title: Schema Converter
---

A simple plugin to convert JSON schemas into their language equivalents.

## Installation

**Native plugin**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install schema-converter@one-for-all
```

**APM package (recommended)**:
```sh
apm install kilianpaquier/ai-integration/plugins/skills/schema-converter
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install schema-converter@one-for-all -g
```

**Skills CLI (recommended)**:

```sh
npx skills add kilianpaquier/ai-integration -g
```

## Skills

### `schema-to-go`

Activated to transform a given JSON schema into its Go equivalent.
The skill needs the following arguments when running (it will be asked otherwise):
- Schema path
- Go package path to generate files into
- Go package name for generated files
