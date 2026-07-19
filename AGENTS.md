# Plugins marketplace

A plugins marketplace contains plugins grouping skills, commands, hooks, LSP servers, MCP servers.

This plugins marketplace aims to get shared compatibility for a bunch-of plugins between at least Claude and Copilot.

## Key differences

- LSP Servers: Copilot uses `fileExtensions` while Claude uses `extensionToLanguage`. Both are set side by side in the same `lspServers` entry.
- MCP Servers: Copilot needs `type` while Claude doesn't always.
- Plugins: Copilot doesn't support yet `source.source=git-subdir` based plugins (works fine with `url`).
- Manifest: plugins use a single agent-neutral `.plugin/plugin.json` manifest (Open Plugin) instead of maintaining separate Claude/Copilot manifests.

## Components support

- Claude and Copilot support `agents`, `commands`, `hooks`, `LSP Servers`, `MCP Servers`, and `skills`.

## Plugins format documentation

- https://code.claude.com/docs/en/hooks
- https://code.claude.com/docs/en/plugins-reference
- https://code.claude.com/docs/en/plugins#plugin-structure-overview
- https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating
- https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference
- https://open-plugins.com/plugin-builders/specification

## Adding a plugin

- Always use the provider description when importing a plugin from another marketplace or declaring a plugin for an external tool (MCP, LSP, etc.).

## Documentation

- Documentation is managed through [**Hugo**](https://gohugo.io/) with the [**Hextra**](https://imfing.github.io/hextra/docs/) theme.

---

@README.md
