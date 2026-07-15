---
description: A simple plugin to convert JSON schemas into its languages equivalent.
title: Schema Converter
---

A simple plugin to convert JSON schemas into its languages equivalent.

## Installation

```sh
my-agent plugin install schema-converter@one-for-all
```

```sh
npx skills add https://gitlab.com/kilianpaquier/ai-integration -g
```

## Skills

### `schema-to-go`

Activated only by a human to transform a given JSON schema into it's Go equivalent.
The skill needs the following arguments:
- Schema path
- Go package path to generate files into
- Go package name for generated files

## Compatibility

This plugin is expected to work with any agent since it can also be simply used with the skills CLI.
