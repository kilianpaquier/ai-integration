# Protected Paths

## Installation

```sh
claude plugin install protected-paths@bunch-of
```

```sh
copilot plugin install protected-paths@bunch-of
```

## Hooks

This plugin registers a `PreToolUse` hook that inspects every tool call's `file_path` and `command`
fields and blocks any that touch a credential or configuration directory:

- `~/.aws`
- `~/.azure`
- `~/.claude`
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

A blocked call exits with code `2` and an explanatory message on stderr, which stops the tool call.

## Compatibility

This plugin is expected to work with Claude and Copilot.
