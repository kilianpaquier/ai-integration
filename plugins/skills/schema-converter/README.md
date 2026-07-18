---
description: A simple plugin to convert JSON schemas into its languages equivalent.
title: Schema Converter
---

A simple plugin to convert JSON schemas into its languages equivalent.

## Installation

**Agent plugin**:
```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-integration
my-agent plugin install schema-converter@one-for-all
```

**Agent Package Manager plugin**:
```sh
apm marketplace add https://gitlab.com/kilianpaquier/ai-integration
apm install schema-converter@one-for-all -g
```

**Skills CLI**:

```sh
npx skills add https://gitlab.com/kilianpaquier/ai-integration -g
```

## Skills

### `schema-to-go`

Activated to transform a given JSON schema into it's Go equivalent.
The skill needs the following arguments when running (it will be asked otherwise):
- Schema path
- Go package path to generate files into
- Go package name for generated files
