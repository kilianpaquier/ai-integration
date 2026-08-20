# Plugins marketplace

A plugins marketplace contains plugins grouping skills, commands, hooks, LSP servers, MCP servers.

This plugins marketplace aims to get shared compatibility for a bunch-of plugins between at least Claude and Copilot.

## Adding a plugin

- Always use the provider description when importing a plugin from another marketplace or declaring a plugin for an external tool (MCP, LSP, etc.).
- Always use **Open Plugin** format (`.plugin/plugin.json`) and **Agent Package Manager** package format (`apm.yml`).

## Plugins format documentation

- https://code.claude.com/docs/en/hooks
- https://code.claude.com/docs/en/plugins-reference
- https://code.claude.com/docs/en/plugins#plugin-structure-overview
- https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating
- https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference
- https://microsoft.github.io/apm/producer/author-primitives/
- https://open-plugins.com/plugin-builders/specification

## Documentation

- Documentation is managed through [**Hugo**](https://gohugo.io/) with the [**Hextra**](https://imfing.github.io/hextra/docs/) theme.

---

@README.md
@CONTRIBUTING.md
