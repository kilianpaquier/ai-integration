# Caveman Autostart

Automatically enables [caveman](https://github.com/JuliusBrussee/caveman)'s ultra-compressed
communication mode at the start of every new session, without having to say "caveman mode" first.

The activation rules are vendored from upstream into [rules/caveman-activate.md](rules/caveman-activate.md)
by [scripts/sh/updater.sh](../../scripts/sh/updater.sh), pinned to a commit tracked by Renovate. This
plugin is self-contained: it does not require the `caveman` skill to be installed separately.

## Installation

```sh
claude plugin install caveman-autostart@bunch-of
```

```sh
copilot plugin install caveman-autostart@bunch-of
```

## Hooks

This plugin registers a `SessionStart` hook that fires on every invocation (startup, resume,
`/clear`, post-compaction) and injects the vendored rules file's content verbatim as additional
context — matching upstream's own `caveman-activate.js` hook, which applies unconditionally with
no `source` filtering.

Set `CAVEMAN_LEVEL` in the environment to request a specific intensity (`lite`, `full`, `ultra`,
`wenyan`). It is appended after the rules content; left unset, the mode's own default (`full`)
applies.

## Compatibility

This plugin is expected to work with Claude, Copilot, and Codex. It requires `node` to be available
on `PATH`, and `PLUGIN_ROOT` or `CLAUDE_PLUGIN_ROOT` to be set by the host to locate the vendored
rules file.

## Tests

```sh
node --test tests/caveman-autostart.test.js
```
