# Code Intelligence Commands

All commands accept `-p, --path <path>` to target a project other than the current directory. Most support `-j, --json` for scripting.

## Index lifecycle

```bash
codegraph init --index   # build the initial index (once per repo)
codegraph sync           # sync changes since last index
codegraph status -j      # index status and statistics
```

## Explore an area

Relevant symbols' source plus their call paths in one shot (same output as the `codegraph_explore` MCP tool). Use this first for broad questions.

```bash
codegraph explore "how is authentication handled" --max-files 5
```

## Read one symbol or file

One symbol's source with caller/callee trail, or a file read with line numbers and dependents (same output as the `codegraph_node` MCP tool).

```bash
codegraph node UserService
codegraph node -f src/auth/session.ts --offset 40 --limit 60
codegraph node -f src/auth/session.ts --symbols-only
```

## Search for symbols

```bash
codegraph query "session" -l 10 -k function -j
```

## Callers and callees

```bash
codegraph callers validateToken -l 20 -j
codegraph callees validateToken -l 20 -j
```

## Impact analysis

What's affected by changing a symbol.

```bash
codegraph impact validateToken -d 2 -j
```

## Affected tests

Test files affected by changed source files.

```bash
codegraph affected src/auth/session.ts -d 5 -j
git diff --name-only | codegraph affected --stdin -q
```

## Project file structure

```bash
codegraph files --pattern "src/auth/**" --format tree -j
```
