# Protected Paths

## Installation

```sh
claude plugin install protected-paths@bunch-of
```

```sh
copilot plugin install protected-paths@bunch-of
```

## Hooks

This plugin registers a `PreToolUse` hook that inspects every tool call and blocks any that touch a
protected directory:

- `~/.agents`
- `~/.apm`
- `~/.aws`
- `~/.azure`
- `~/.claude`
- `~/.codex`
- `~/.config`
- `~/.copilot`
- `~/.docker`
- `~/.git-credentials`
- `~/.gnupg`
- `~/.kube`
- `~/.netrc`
- `~/.npmrc`
- `~/.pypirc`
- `~/.ssh`

An allow-list carves out specific subpaths needed for plugins and instructions to keep working under
`~/.apm`, `~/.claude`, `~/.codex`, and `~/.copilot`, which are otherwise fully denied.

The hook also catches recursive tools (`grep -r`, `find`, `tar`, `rsync`, `ls -R`, ...) and bare
references like `cd ~` that could reach a protected directory without naming it directly.

A known limitation: a relative path used after a `cd` earlier in the same command is not resolved
against that new directory.

A blocked call prints an explanatory message and denies the tool call, across Claude, Copilot, and Codex.

## Compatibility

This plugin is expected to work with Claude, Copilot, and Codex. It requires `node` to be available on
`PATH`.

## Tests

```sh
node --test tests/protected-paths.test.js
```
