---
description: Automatically enable caveman ultra-compressed without saying "caveman mode" first.
title: Caveman Autostart
---

Automatically enable [caveman](https://github.com/JuliusBrussee/caveman)'s ultra-compressed
communication mode at the start of every new session, without having to say "caveman mode" first.

## Installation

```sh
my-agent plugin install caveman-autostart@one-for-all
```

## Hooks

This plugin registers a `SessionStart` hook that fires on every invocation (startup, resume, clear, post-compaction)
and injects [the vendored rules](https://github.com/JuliusBrussee/caveman/blob/main/src/rules/caveman-activate.md)
file's content verbatim as additional context.

Set `CAVEMAN_LEVEL` in the environment to request a specific intensity (`lite`, `full`, `ultra`, `wenyan`).

## Compatibility

This plugin is expected to work with Claude, Copilot, and Codex.

It requires `node` to be available on `PATH`, and `PLUGIN_ROOT` or `CLAUDE_PLUGIN_ROOT` to be set by the host agent
to locate the vendored rules file.

## Tests

```sh
node --test tests/caveman-autostart.test.js
```
