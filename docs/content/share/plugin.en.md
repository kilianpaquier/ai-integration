---
description: Group components together for a better integration.
title: Plugin
weight: 20
---

*Introduced by Anthropic.*

A plugin is a Git repository containing
[agents](../../concepts/agent),
[commands](../../concepts/command),
[hooks](../../concepts/hook),
[LSPs](../../concepts/lsp),
[MCPs](../../concepts/mcp) and
[skills](../../concepts/skill) (availability may depend on the agent installing it).

A plugin by itself cannot really be used, it is expected to be bundle within a [marketplace](../marketplace),
either containing only the plugin or with others (larger marketplaces).

## Structure

A plugin is identified by a `plugin.json` file. Its place and content (small variations) depends on the target agent(s) audience.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
- **Format**: [Open Plugin Spec](https://open-plugins.com/plugin-builders/specification)
- **Compatibility**: Claude Code, Copilot (additional compatibility to be verified)

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
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── .mcp.json
└── .lsp.json
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/plugins-reference)
- **Compatibility**: Codex, Copilot (additional compatibility to be verified)

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
- **Format**: [Codex](https://learn.chatgpt.com/codex/build-plugins)
- **Compatibility**: Codex (additional compatibility to be verified)

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
- **Format**: [Copilot](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating)
- **Compatibility**: Copilot (additional compatibility to be verified)

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

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/docs/reference/plugins)
- **Compatibility**: specific to the agent

```tree
repository/
├── .cursor-plugin/
│   └── plugin.json
├── agents/
│   └── reviewer.md
├── commands/
│   └── special.md
├── skills/
│   └── skill-name/
│       └── SKILL.md
├── rules/
│   └── prefer-const.mdc
├── hooks/
│   └── hooks.json
└── mcp.json
```
{{< /tab >}}

{{< /tabs >}}

## Limitations

### LSP format

While LSPs can be defined in `.lsp.json`, a preferable way is to define them inline in `plugin.json`
because its format varies between agents and validation fails if unknown keys are present (unlike `.mcp.json` where unknown keys are just ignored).

### Hooks environment variables

In most cases, hooks call custom scripts (shell, powershell, bash, js, etc.)
and they use predefined environment variables to pinpoint those (e.g. `PLUGIN_ROOT`, `CLAUDE_PLUGIN_ROOT`, `CLAUDE_PLUGIN_DATA`, etc.).

However with some agents (e.g. VSCode Chat), those variables are not correctly set on remote environments (e.g. WSL or SSH)
when the host OS isn't the same as the remote's: a Windows host path gets injected as-is into the remote Linux shell,
which mangles it ([microsoft/vscode#313201](https://github.com/microsoft/vscode/issues/313201)).
