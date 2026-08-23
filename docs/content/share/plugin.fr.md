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
```

Le répertoire `com.example.client` est une extension client.
Il contient des composants dans un format spécifique à l'agent *runtime* (hooks, serveurs MCP, skills, etc.).

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
- **Format** : [**Codex**](https://learn.chatgpt.com/codex/build-plugins)
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
  - `COPILOT_PLUGIN_DATA` (répertoire de données du plugin, aliasé en `CLAUDE_PLUGIN_DATA`)

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
- **Format** : [**Antigravity**](https://antigravity.google/docs/cli/plugins)

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

{{< /tabs >}}

## Limitations

> [!warning]Format LSP
> Bien que les LSP puissent être définis dans `.lsp.json`, une meilleure approche consiste à les définir en ligne dans `plugin.json`
> car [leur format varie selon les agent *runtimes*](/components/lsp).

> [!warning]Variables d'environnement des hooks
> Dans la plupart des cas, les *hooks* appellent des scripts personnalisés (shell, powershell, bash, js, etc.)
> et utilisent des variables d'environnement prédéfinies pour les localiser (par exemple `PLUGIN_ROOT`, `CLAUDE_PLUGIN_ROOT`, `CLAUDE_PLUGIN_DATA`, etc.).
>
> Cependant, avec certains agent *runtimes* (par exemple VSCode Chat), ces variables ne sont pas correctement définies sur les environnements distants
> (par exemple WSL ou SSH) lorsque l'OS hôte diffère de celui du distant.
>
> Voir [microsoft/vscode#313201](https://github.com/microsoft/vscode/issues/313201) et [microsoft/vscode#326166](https://github.com/microsoft/vscode/issues/326166) pour plus de détails.
