---
description: Regroupez des composants pour une meilleure intégration.
title: Plugin
weight: 20
---

Un plugin est un dépôt Git capable de partager d'un coup un ensemble de composants.

Les plugins sont généralement regroupés au sein de [marketplaces](/share/marketplace) pour être installés par les agent *runtimes*,
mais ils peuvent aussi être installés directement via l'[**Agent Package Manager**](/share/apm)
ou certains agent *runtimes* (comme [**goose**](https://goose-docs.ai/docs/guides/context-engineering/plugins/#install-a-plugin)).

## Structure

Un plugin est généralement identifié par un fichier `plugin.json` (peut varier selon l'agent *runtime*).
Son emplacement et son contenu (avec de légères variations) dépendent du (ou des) agent *runtime(s)* cible(s).

{{< tabs >}}

{{< tab name="Agent Plugins" >}}
- **Format** : [**Agent Plugins**](https://agent-plugins.org/specification)
- **Lu par** : **Copilot**, **Cursor**, **Devin**, **Hermes**
- **Variables d'environnement** :
  - `PLUGIN_ROOT` (répertoire du plugin)
  - `PLUGIN_DATA` (répertoire de données du plugin)

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

Le répertoire `com.example.client` est une extension client.
Il contient des composants dans un format spécifique à l'agent *runtime* (hooks, serveurs MCP, agents, etc.).

- **Copilot** : `com.github.copilot/`
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/plugins-reference)
- **Aussi lu par** : **Codex** (partiellement), **Copilot** (partiellement), **Devin** (partiellement)
- **Variables d'environnement** :
  - `CLAUDE_PLUGIN_ROOT` (répertoire du plugin)
  - `CLAUDE_PLUGIN_DATA` (répertoire de données du plugin)
  - `CLAUDE_PROJECT_DIR` (répertoire de l'espace de travail)
  - `CLAUDE_PLUGIN_OPTION_<KEY>` (valeurs [`userConfig`](https://code.claude.com/docs/en/plugins-reference#user-configuration),
    compatible uniquement avec **Claude Code**)

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
- **Format** : [**Codex**](https://developers.openai.com/plugins/build/plugins)
- **Variables d'environnement** :
  - `PLUGIN_ROOT` (répertoire racine du plugin)
  - `PLUGIN_DATA` (répertoire de données du plugin)
  - `CLAUDE_PLUGIN_ROOT` / `CLAUDE_PLUGIN_DATA` (alias conservés pour compatibilité)

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
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating)
- **Variables d'environnement** :
  - `PLUGIN_ROOT` (répertoire du plugin)
  - `PLUGIN_DATA` (répertoire de données du plugin, aliasé en `COPILOT_PLUGIN_DATA` et `CLAUDE_PLUGIN_DATA`)

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
- **Format** : [**Cursor**](https://cursor.com/docs/plugins)
- **Variables** :
  - `CURSOR_PLUGIN_ROOT` (répertoire du plugin, résolu dans `mcp.json`)
  - `CLAUDE_PLUGIN_ROOT` (alias de `CURSOR_PLUGIN_ROOT`)

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
- **Format** : [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/plugins)

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

Seul `plugin.json` est requis.
Sans l'extension `ai.mistral.vibe` dans le manifeste, **Mistral Vibe** ne charge que `skills/` et `mcp.json`.
{{< /tab >}}

{{< tab name="Antigravity" >}}
- **Format** : [**Antigravity**](https://antigravity.google/docs/plugins?tab=cli)

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

Le manifeste est soit `plugin.json`, soit `.antigravity-plugin/plugin.json`.
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format** : [**Devin**](https://docs.devin.ai/cli/extensibility/plugins/overview)
- **Variables d'environnement** :
  - `PLUGIN_ROOT` (répertoire du plugin)
  - `PLUGIN_DATA` (répertoire de données du plugin)
  - `DEVIN_PROJECT_DIR` (répertoire de l'espace de travail)

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
- **Format** : [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/developer-guide/plugins)

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
- **Format** : [**OpenCode**](https://opencode.ai/docs/build/plugins)

```tree
repository/
├── package.json
└── src/
    ├── index.ts # partie serveur (outils, hooks, commandes, agents)
    └── tui.tsx # partie interface terminal
```

Les plugins locaux sous `.opencode/plugins/` sont chargés automatiquement, les autres sont listés dans le tableau `plugins` de `opencode.json`.
{{< /tab >}}

{{< tab name="Pi" >}}
- **Format** : [**Pi**](https://github.com/earendil-works/pi/blob/main/packages/coding-agent/docs/packages.md)

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

Sans clé `pi` dans le `package.json`, **Pi** découvre les extensions, skills, prompts et thèmes depuis ces répertoires.
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]Format LSP
> Bien que les LSP puissent être définis dans `.lsp.json`, une meilleure approche consiste à les définir en ligne dans `plugin.json`
> car [leur format varie selon les agent *runtimes*](/components/lsp).
