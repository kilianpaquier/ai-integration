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

Every absolute-path-looking token in the tool call is resolved with `realpath -m` (collapsing `..`
segments, symlinks, and redundant slashes) before being compared against the allow/deny lists, so
comparisons are exact path-prefix checks rather than raw text matching. A resolved path is denied if it
is inside (or equal to) a denied directory and not inside an allowed subpath, **or** if it is itself an
ancestor of a denied directory - the latter catches recursive tools (`grep -r`, `find`, `tar`, `rsync`,
`ls -R`, ...) and bare references like `cd ~` that could reach a protected directory without ever naming
it directly, without needing to recognize the specific recursive flag or command in use.

This does not track `cd`/`cwd` changes across chained commands, so a relative path used after an
earlier `cd` into a subdirectory is not resolved against that new working directory - a known,
accepted gap rather than something this hook attempts to fully model.

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
