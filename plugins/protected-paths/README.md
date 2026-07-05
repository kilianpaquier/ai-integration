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

Allowed paths are stripped out of the tool call before the deny-list scan runs, so a call combining an
allowed path with a separately denied path (e.g. two commands chained with `;`) is still blocked on the
denied part.

If the tool call contains a `..` path segment at all, the allow-list is skipped entirely and
the raw text is deny-scanned instead, so a traversal like `~/.claude/plugins/../.credentials.json` cannot
hide behind the allowed prefix.

A blocked call prints an explanatory message on stderr and exits `0` with a `permissionDecision: "deny"`
JSON body on stdout (both top-level, for Copilot, and wrapped in `hookSpecificOutput`, for Claude/Codex),
which stops the tool call under all three agents.

Claude's `transcript_path` field (always pointing under `~/.claude/projects`) is stripped from the tool
call before the deny-list scan runs, since it is bookkeeping metadata rather than a tool argument and
would otherwise block every single tool call once `~/.claude` is denied.

## Compatibility

This plugin is expected to work with Claude, Copilot, and Codex.

## Tests

```sh
./tests/protected-paths.test.sh
```
