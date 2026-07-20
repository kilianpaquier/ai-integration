# caveman-autostart

Automatically enable [**caveman**](https://github.com/JuliusBrussee/caveman) mode, no skill or prompt invocation needed.

## Installation

<!-- docs-sync:start -->

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Native plugin**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install caveman-autostart@one-for-all
```

**APM package (recommended)**:
```sh
apm install kilianpaquier/ai-integration/plugins/hooks/caveman-autostart -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install caveman-autostart@one-for-all -g
```

<!-- docs-sync:end -->

## Hooks

This plugin registers a `SessionStart` hook that fires on every invocation (startup, resume, clear, post-compaction)
and injects [the vendored skill](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md)
file's content verbatim as additional context.

Set `CAVEMAN_LEVEL` in the environment to request a specific intensity (`lite`, `full`, `ultra`, `wenyan`).

## Tests

```sh
node --test tests/caveman-autostart.test.js
```
