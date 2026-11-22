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
    ├── agents/
    │   └── reviewer.agent.md
    └── hooks/
        └── hooks.json
```

The `com.example.client` directory is a client extension.
It contains components in an agent-runtime-specific format (hooks, MCP servers, agents, etc.).

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
- **Format**: [**Codex**](https://developers.openai.com/plugins/build/plugins)
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
  - `PLUGIN_DATA` (plugin data directory, aliased as `COPILOT_PLUGIN_DATA` and `CLAUDE_PLUGIN_DATA`)

```tree
repository/
├── plugin.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── mcp.json
└── com.github.copilot/
    ├── agents/
    │   └── reviewer.agent.md
    ├── commands/
    │   └── special.md
    ├── hooks/
    │   └── hooks.json
    ├── lsp.json
    └── rules/
```
{{< /tab >}}

{{< tab name="Cursor" >}}
- **Format**: [**Cursor**](https://cursor.com/docs/plugins)
- **Variables**:
  - `CURSOR_PLUGIN_ROOT` (plugin directory, expanded in `mcp.json`)
  - `CLAUDE_PLUGIN_ROOT` (alias of `CURSOR_PLUGIN_ROOT`)

```tree
repository/
├── .cursor-plugin/
│   └── plugin.json
├── rules/
│   └── rule-name.mdc
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── hooks/
│   └── hooks.json
└── mcp.json
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/plugins)

```tree
repository/
├── plugin.json
├── mcp.json
├── libraries.json
├── connectors.json
├── skills/
│   └── skill-name/
│       └── SKILL.md
└── ai.mistral.vibe/
    ├── agents/
    │   └── reviewer.toml
    ├── hooks.toml
    └── knowledge/
        └── knowledge-name/
            └── KNOWLEDGE.md
```

Only `plugin.json` is required.
Without the `ai.mistral.vibe` extension in the manifest, **Mistral Vibe** loads only `skills/` and `mcp.json`.
{{< /tab >}}

{{< tab name="Antigravity" >}}
- **Format**: [**Antigravity**](https://antigravity.google/docs/plugins?tab=cli)

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

The manifest is either `plugin.json` or `.antigravity-plugin/plugin.json`.
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

{{< tab name="OpenCode" >}}
- **Format**: [**OpenCode**](https://opencode.ai/docs/build/plugins)

```tree
repository/
├── package.json
└── src/
    ├── index.ts # server part (tools, hooks, commands, agents)
    └── tui.tsx # terminal UI part
```

Local plugins under `.opencode/plugins/` load automatically, others are listed in the `plugins` array of `opencode.json`.
{{< /tab >}}

{{< tab name="Pi" >}}
- **Format**: [**Pi**](https://github.com/earendil-works/pi/blob/main/packages/coding-agent/docs/packages.md)

```tree
repository/
├── package.json
├── extensions/
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── prompts/
└── themes/
```

```json
{
    "name": "my-pi-package",
    "keywords": ["pi-package"]
}
```

Without a `pi` key in `package.json`, **Pi** discovers extensions, skills, prompts and themes from these directories.
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]LSP format
> While LSPs can be defined in `.lsp.json`, a preferable way is to define them inline in `plugin.json`
> because [its format varies between agent runtimes](/components/lsp).
