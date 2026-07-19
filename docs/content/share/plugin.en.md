---
description: Group components together for a better integration.
title: Plugin
weight: 20
---

A plugin is a Git repository capable of sharing at once a bundle of components.

Plugins are usually bundled within [marketplaces](/share/marketplace) to be installed by agents,
but they can also be installed directly through the [**Agent Package Manager**](/share/apm)
or some agents (like [**goose**](https://goose-docs.ai/docs/guides/context-engineering/plugins/#install-a-plugin)).

## Structure

A plugin is identified by a `plugin.json` file. Its place and content (with small variations) depend on the target agent(s).

{{< tabs >}}

{{< tab name="Open Plugin" >}}
- **Format**: [**Open Plugin**](https://open-plugins.com/plugin-builders/specification)
- **Read by**: **Claude Code** (partial), **Copilot** (partial)
- **Environment variables**:
  - `PLUGIN_ROOT` (plugin directory)

```tree
repository/
├── .plugin/
│   └── plugin.json
├── agents/
│   └── reviewer.md
├── commands/
│   └── special.md
├── hooks/
│   └── hooks.json
├── rules/
│   └── prefer-const.mdc
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── .mcp.json
└── .lsp.json
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/plugins-reference)
- **Also read by**: **Codex** (partial), **Copilot** (partial)
- **Environment variables**:
  - `CLAUDE_PLUGIN_ROOT` (plugin directory)
  - `CLAUDE_PLUGIN_DATA` (plugin data directory)
  - `CLAUDE_PROJECT_DIR` (workspace directory)
  - `CLAUDE_PLUGIN_OPTION_<KEY>` ([`userConfig`](https://code.claude.com/docs/en/plugins-reference#user-configuration) values,
    compatible with **Claude Code** only)

```tree
repository/
├── .claude-plugin/
│   └── plugin.json
├── agents/
│   └── reviewer.md
├── commands/
│   └── special.md
├── hooks/
│   └── hooks.json
├── monitors/
│   └── monitors.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── .mcp.json
└── .lsp.json
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [**Codex**](https://learn.chatgpt.com/codex/build-plugins)
- **Environment variables**:
  - `PLUGIN_ROOT` (plugin root directory)
  - `PLUGIN_DATA` (plugin data directory)
  - `CLAUDE_PLUGIN_ROOT` / `CLAUDE_PLUGIN_DATA` (aliases kept for compatibility)

```tree
repository/
├── .codex-plugin/
│   └── plugin.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── hooks/
│   └── hooks.json
├── .mcp.json
└── .app.json
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating)
- **Environment variables**:
  - `PLUGIN_ROOT` (plugin directory)
  - `COPILOT_PLUGIN_DATA` (plugin data directory, aliased as `CLAUDE_PLUGIN_DATA`)

```tree
repository/
├── plugin.json
├── agents/
│   └── reviewer.agent.md
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── hooks.json
└── .mcp.json
```
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]LSP format
> While LSPs can be defined in `.lsp.json`, a preferable way is to define them inline in `plugin.json`
> because [its format varies between agents](/components/lsp).

> [!warning]Hooks environment variables
> In most cases, hooks call custom scripts (shell, powershell, bash, js, etc.)
> and use predefined environment variables to pinpoint those (e.g. `PLUGIN_ROOT`, `CLAUDE_PLUGIN_ROOT`, `CLAUDE_PLUGIN_DATA`, etc.).
>
> However, with some agents (e.g. VSCode Chat), those variables are not correctly set on remote environments (e.g. WSL or SSH) when the host OS isn't the same as the remote's.
>
> See [microsoft/vscode#313201](https://github.com/microsoft/vscode/issues/313201) and [microsoft/vscode#326166](https://github.com/microsoft/vscode/issues/326166) for more details.
