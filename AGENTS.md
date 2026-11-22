# ai-integration

The `one-for-all` plugin marketplace, and the source of the AI Integration [**Hugo**](https://gohugo.io) site.
Each plugin targets as many agent runtimes as it can, at least [**Claude Code**](https://code.claude.com),
[**Codex**](https://openai.com/codex),
[**Copilot**](https://github.com/features/copilot),
[**Cursor**](https://cursor.com),
[**Antigravity**](https://antigravity.google)
and [**Devin**](https://devin.ai).
Read [CONTRIBUTING.md](CONTRIBUTING.md) before adding a plugin or moving a file inside one, since it holds the plugin layout, the per-runtime compatibility table and the "New plugin" steps.

Read the matching page before writing a component or changing how plugins get shared, since each one covers the format per runtime.

- Components: `docs/content/components/<kind>.en.md`, with `<kind>` one of `agent`, `command`, `hook`, `instruction`, `lsp`, `mcp`, `monitor`, `skill`.
- Sharing: `docs/content/share/<topic>.en.md`, with `<topic>` one of `apm`, `marketplace`, `package`, `plugin`, `skills-cli`.

## Changing a plugin

A plugin keeps one source under `plugins/<plugin>/.apm/`, and a **mirror** per runtime format that changes with it.

- The root `skills` and `agents` entries and `com.github.copilot/agents/` are symlinks to `.apm/`.
- An agent with its own frontmatter (*e.g.* `model`) gets a copy in `com.github.copilot/agents/` for **Copilot** and `.cursor-plugin/agents/` for **Cursor**.
- A hook has four mirrors: `.apm/hooks/hooks.json`, `hooks/claude.json`, `hooks/cursor.json` and `com.github.copilot/hooks/hooks.json`.
- **Copilot**'s `hooks.json` keeps its own event format with Claude-style matchers, and **VS Code**'s **Copilot** agent host fires hooks only through `.plugin/plugin.json`.
- A hook executable is a `.js` file in `plugins/<plugin>/scripts/`.
- An MCP server has two mirrors, `mcp.json` and `mcp_config.json`.
- Its docs pages `docs/content/interoperability/ai-integration/<plugin>.en.md` and `<plugin>.fr.md` change together.
- Running `just docs::sync` copies their block between `BEGIN_AII_DOCS` and `END_AII_DOCS` from the plugin README.
- Bump a plugin whose files the branch changes by one minor version over its version on `main`, in its `apm.yml` and every `plugin.json` at once.
- A new plugin starts at `0.1.0` and keeps it on the branch that creates it, as does a plugin the branch already bumped, and plan-only work keeps its version.
- The `version` of `hooks/cursor.json` and `com.github.copilot/hooks/hooks.json` is the hook schema version, `1`.

Done when every mirror carries the change and `just docs::sync` has run after a README change.

## Vendored plugins

- The `scripts/sh/updater.sh` script declares each upstream (a `# renovate:` ref) and the files it syncs.
- A new vendored file goes in as a line there and a `just update` run, instead of a hand copy.
- Run `just update` or `scripts/sh/renovate.sh` for anything else only when asked, since both clone upstreams and rewrite vendored files.
- The sync rewrites a vendored file's body and keeps its frontmatter, so a change to a vendored file is a frontmatter change.
- A vendored file declares `metadata.upstream`, plus `metadata.modified` stating what changed for a modified Apache-2.0 one.
- [**Renovate**](https://docs.renovatebot.com) bumps vendored plugins through `scripts/sh/renovate.sh`.

## Generated files

- Running `apm pack` writes the `marketplace.json` of `.claude-plugin/`, `.agents/plugins/` and `.github/plugin/` from the root `apm.yml`, which is the file to edit.
- The [**kickr**](https://gitlab.com/kickr-dev/kickr) generator owns `Justfile`, `docs/Justfile`, `CODE_OF_CONDUCT.md`, `SECURITY.md` and the `BEGIN_KICKR_*` blocks of the README and CONTRIBUTING.

## Checks

- Run `shellcheck` on each changed script under `scripts/sh/`, since CI skips shell.
- Run `just docs::build` after changing anything under `docs/`.
- Test a hook executable in `plugins/<plugin>/tests/*.test.js`, run with `node --test`, and leave plugin config untested (JSON, evals, the **OpenCode** `.mjs` and **Hermes** `.py` adapters).
