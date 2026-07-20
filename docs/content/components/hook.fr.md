---
title: Hook
---

Les *hooks* sont des configurations déterministes qui exécutent une commande, un *prompt*, un appel webhook, etc.
lorsqu'un événement se déclenche pendant l'exécution de la session.

Les événements se déclenchent à divers moments : au démarrage d'une session (`SessionStart`),
lorsqu'un utilisateur soumet une instruction (`UserPromptSubmit`),
avant l'exécution d'un outil (`PreToolUse`), et bien d'autres cas (la diversité dépend de l'agent utilisé).

Les cas d'usage typiques des *hooks* incluent la limitation d'accès aux fichiers, la protection contre les commandes destructrices,
la télémétrie, le lint de code, ou même la sauvegarde et la restauration automatiques des souvenirs de session.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> Ce format ne peut être fourni que via des [plugins](/share/plugin).

- **Format** : [**Open Plugin**](https://open-plugins.com/agent-builders/components/hooks)

```tree
repository/
└── hooks/
    └── hooks.json
```

```json
{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Bash",
                "hooks": [
                    {
                        "type": "command",
                        "command": "${PLUGIN_ROOT}/hooks/lint-check.sh"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/hooks#configuration)
- **Également lu par** : **Copilot** (niveau dépôt uniquement)
- **Pour aller plus loin** :
  [events](https://code.claude.com/docs/en/hooks#hook-events),
  [matchers](https://code.claude.com/docs/en/hooks#matcher-patterns),
  [actions](https://code.claude.com/docs/en/hooks#hook-handler-fields)

```tree
repository/
└── .claude/
    ├── settings.json
    └── settings.local.json
~/.claude/
└── settings.json
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── hooks/
    └── hooks.json
```

```json
{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Bash",
                "hooks": [
                    {
                        "type": "command",
                        "command": ".claude/hooks/lint-check.sh",
                        "shell": "bash"
                    },
                    {
                        "type": "command",
                        "command": ".claude\\hooks\\lint-check.ps1",
                        "shell": "powershell"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format** : [**Codex**](https://learn.chatgpt.com/docs/hooks#config-shape)
- **Pour aller plus loin** :
  [events](https://learn.chatgpt.com/docs/hooks#sessionstart),
  [matchers](https://learn.chatgpt.com/docs/hooks#matcher-patterns),
  [actions](https://learn.chatgpt.com/docs/hooks#config-shape)

```tree
repository/
└── .codex/
    └── hooks.json
~/.codex/
└── hooks.json
~/.codex/plugins/cache/<marketplace>/<plugin>/<version>/
└── hooks/
    └── hooks.json
```

```json
{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Bash",
                "hooks": [
                    {
                        "type": "command",
                        "command": ".codex/hooks/lint-check.sh",
                        "commandWindows": ".codex\\hooks\\lint-check.ps1"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)
- **Pour aller plus loin** :
  [events](https://docs.github.com/en/copilot/reference/hooks-reference#hook-events),
  [matchers](https://docs.github.com/en/copilot/reference/hooks-reference#matcher-filtering),
  [actions](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)

```tree
repository/
└── .github/
    ├── copilot/
    │   ├── settings.json
    │   └── settings.local.json
    └── hooks/
        └── lint-check.json
~/.copilot/
├── hooks/
│   └── lint-check.json
└── settings.json
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── hooks/
    └── hooks.json
```

```json
{
    "version": 1,
    "hooks": {
        "preToolUse": [
            {
                "type": "command",
                "matcher": "bash",
                "bash": ".github/hooks/lint-check.sh",
                "powershell": ".github\\hooks\\lint-check.ps1"
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format** : [**Mistral Vibe**](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks)
- **Pour aller plus loin** :
  [events](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks),
  [matchers](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks),
  [actions](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks)

```tree
repository/
└── .vibe/
    └── hooks.toml
~/.vibe/
└── hooks.toml
```

```toml
[[hooks]]
name = "lint-check"
type = "before_tool"
match = "bash"
command = "node .vibe/hooks/link-check.js"
```

Les hooks de projet se chargent avant les hooks utilisateur.
{{< /tab >}}

{{< /tabs >}}
