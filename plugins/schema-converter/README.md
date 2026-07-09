# Schema Converter

A simple plugin to convert JSON schemas into its languages equivalent.

## Installation

```sh
claude plugin install schema-converter@bunch-of
```

```sh
copilot plugin install schema-converter@bunch-of
```

```sh
npx skills add https://gitlab.com/kilianpaquier/ai-marketplace -s schema-to-go -g
```

## Skills

### `schema-to-go`

Activated only by a human to transform a given JSON schema into it's Go equivalent.
The skill needs the following arguments:
- Schema path
- Go package path to generate files into
- Go package name for generated files

## Compatibility

This plugin is expected to work with Claude and Copilot.
