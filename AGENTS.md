# Plugins marketplace

A plugins marketplace contains plugins grouping skills, commands, hooks, LSP servers, MCP servers.

This plugins marketplace aims to get shared compatibility for a bunch-of plugins between as many agent runtimes as possible
(at least Claude, Codex, Copilot, Antigravity, Devin and Hermes Agent).

## Adding a plugin

- Always use the provider description when importing a plugin from another marketplace or declaring a plugin for an external tool (MCP, LSP, etc.).
- Always use **Agent Plugins** format (`plugin.json`) and **Agent Package Manager** package format (`apm.yml`).

## Components documentation

Per-component, per-agent-runtime format reference (manifest, hooks, MCP, skills, subagents, instructions, LSP, monitors):

@docs/content/components/agent.en.md
@docs/content/components/command.en.md
@docs/content/components/hook.en.md
@docs/content/components/instruction.en.md
@docs/content/components/lsp.en.md
@docs/content/components/mcp.en.md
@docs/content/components/monitor.en.md
@docs/content/components/skill.en.md

## Sharing documentation

@docs/content/share/plugin.en.md
@docs/content/share/marketplace.en.md
@docs/content/share/apm.en.md
@docs/content/share/package.en.md
@docs/content/share/skills-cli.en.md

## Documentation

- Documentation is managed through [**Hugo**](https://gohugo.io/) with the [**Hextra**](https://imfing.github.io/hextra/docs/) theme.

---

@README.md
@CONTRIBUTING.md
