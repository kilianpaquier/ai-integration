# Plugins marketplace

A plugins marketplace contains plugins grouping skills, commands, hooks, LSP servers, MCP servers.

This plugins marketplace aims to get shared compatibility for a bunch-of plugins between at least Claude and Copilot.

## Key differences

- LSP Servers: Copilot uses `fileExtensions` while Claude uses `extensionToLanguage`.
- MCP Servers: Copilot needs `type` while Claude doesn't always.
- Plugins: Copilot doesn't support yet `source.source=git-subdir` based plugins (works fine with `url`).

## Concepts support

- Claude and Copilot support `agents`, `commands`, `hooks`, `LSP Servers`, `MCP Servers`, and `skills`.

## Workaround rules

- Until [`CLAUDE_PLUGIN_ROOT`](https://github.com/microsoft/vscode/issues/313201) is correctly valorized in VSCode, additional changes must be made to plugins using this variable for Copilot compatibility.
- Until [`git-subdir`](https://github.com/github/copilot-cli/issues/3376) is supported by Copilot, plugins under other marketplace must be cloned and maintained through automated scripts here.

## Plugins format documentation

- https://code.claude.com/docs/en/hooks
- https://code.claude.com/docs/en/plugins-reference
- https://code.claude.com/docs/en/plugins#plugin-structure-overview
- https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating
- https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference

## Adding a plugin

- Always use the provider description when importing a plugin from another marketplace or declaring a plugin for an external tool (MCP, LSP, etc.).

---

@README.md
