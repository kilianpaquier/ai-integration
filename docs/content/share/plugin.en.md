---
description: Group components together for a better integration.
title: Plugin
weight: 20
---

A plugin is a Git repository capable of sharing at once a bundle of components.

Plugins are usually bundled within [marketplaces](/share/marketplace) to be installed by agent runtimes,
but they can also be installed directly through the [**Agent Package Manager**](/share/apm)
or some agent runtimes (like [**goose**](https://goose-docs.ai/docs/guides/context-engineering/plugins/#install-a-plugin)).

## Structure

A plugin is commonly (may change depending on the agent runtime) identified by a `plugin.json` file.
Its place and content (with small variations) depend on the target agent runtime(s).

{{< tabs >}}

{{< tab name="Agent Plugins" >}}
- **Format**: [**Agent Plugins**](https://agent-plugins.org/specification)
- **Read by**: **Copilot**, **Cursor**, **Devin**, **Hermes**
- **Environment variables**:
  - `PLUGIN_ROOT` (plugin directory)
  - `PLUGIN_DATA` (plugin data directory)

```tree
repository/
├── plugin.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── mcp.json
└── com.example.client/
```

The `com.example.client` directory is a client extension.
It contains components in an agent-runtime-specific format (hooks, MCP servers, skills, etc.).

- **Copilot**: `com.github.copilot/`
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/plugins-reference)
- **Also read by**: **Codex** (partial), **Copilot** (partial), **Devin** (partial)
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

{{< tab name="Antigravity" >}}
- **Format**: [**Antigravity**](https://antigravity.google/docs/cli/plugins)

```tree
repository/
├── plugin.json
├── mcp_config.json
├── hooks.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── agents/
│   └── reviewer.md
└── rules/
    └── rule-name.md
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format**: [**Devin**](https://docs.devin.ai/cli/extensibility/plugins/overview)
- **Environment variables**:
  - `PLUGIN_ROOT` (plugin directory)
  - `PLUGIN_DATA` (plugin data directory)
  - `DEVIN_PROJECT_DIR` (workspace directory)

```tree
repository/
├── .devin-plugin/
│   └── plugin.json
├── AGENTS.md
├── rules/
│   └── rule-name.md
├── agents/
│   └── reviewer.md
├── hooks.json
├── .mcp.json
└── skills/
    └── skill-name/
        └── SKILL.md
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
- **Format**: [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/developer-guide/plugins)

```tree
repository/
├── plugin.yaml
├── __init__.py
└── skills/
    └── skill-name/
        └── SKILL.md
```

```python
# __init__.py
def register(ctx):
    ctx.register_hook("pre_tool_call", my_pre_tool_call)
    ctx.register_tool("my_tool", my_tool_handler)
    ctx.register_skill("my-skill", "skills/my-skill/SKILL.md")
    ctx.register_command("my-command", my_command_handler)
    # `register_cli_command`, `register_platform`, `register_memory_provider`
    # `register_context_engine`, `register_image_gen_provider`
    # `register_slack_action_handler`, `register_middleware`
```
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]LSP format
> While LSPs can be defined in `.lsp.json`, a preferable way is to define them inline in `plugin.json`
> because [its format varies between agent runtimes](/components/lsp).

> [!warning]Hooks environment variables
> In most cases, hooks call custom scripts (shell, powershell, bash, js, etc.)
> and use predefined environment variables to pinpoint those (e.g. `PLUGIN_ROOT`, `CLAUDE_PLUGIN_ROOT`, `CLAUDE_PLUGIN_DATA`, etc.).
>
> However, with some agent runtimes (e.g. VSCode Chat), those variables are not correctly set on remote environments (e.g. WSL or SSH) when the host OS isn't the same as the remote's.
>
> See [microsoft/vscode#313201](https://github.com/microsoft/vscode/issues/313201) and [microsoft/vscode#326166](https://github.com/microsoft/vscode/issues/326166) for more details.
