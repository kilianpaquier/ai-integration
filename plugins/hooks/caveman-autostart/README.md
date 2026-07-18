# caveman-autostart

Automatically enable [**caveman**](https://github.com/JuliusBrussee/caveman)'s ultra-compressed
communication mode at the start of every new session, without having to say "caveman mode" first.

## Installation

<!-- docs-tab:start -->

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Agent plugin**:
```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-integration
my-agent plugin install caveman-autostart@one-for-all
```

**Agent Package Manager plugin**:
```sh
apm marketplace add https://gitlab.com/kilianpaquier/ai-integration
apm install caveman-autostart@one-for-all -g
```

<!-- docs-tab:end -->

## Hooks

This plugin registers a `SessionStart` hook that fires on every invocation (startup, resume, clear, post-compaction)
and injects [the vendored skill](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md)
file's content verbatim as additional context.

Set `CAVEMAN_LEVEL` in the environment to request a specific intensity (`lite`, `full`, `ultra`, `wenyan`).

## Tests

```sh
node --test tests/caveman-autostart.test.js
```
