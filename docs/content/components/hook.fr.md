---
title: Hook
---

Les *hooks* sont des configurations déterministes qui exécutent une commande, un *prompt*, un appel webhook, etc.
lorsqu'un événement se déclenche pendant l'exécution de la session.

Les événements se déclenchent à divers moments : au démarrage d'une session (`SessionStart`),
lorsqu'un utilisateur soumet une instruction (`UserPromptSubmit`),
avant l'exécution d'un outil (`PreToolUse`), et bien d'autres cas (la diversité dépend de l'agent *runtime* utilisé).

Les cas d'usage typiques des *hooks* incluent la limitation d'accès aux fichiers, la protection contre les commandes destructrices,
la télémétrie, le lint de code, ou même la sauvegarde et la restauration automatiques des souvenirs de session.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/hooks#configuration)
- **Aussi lu par** : **Copilot** (niveau dépôt uniquement), **Cursor**
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
~/.claude/plugins/cache/<marketplace>/<plugin>/<version>/
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
└── com.github.copilot/
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

{{< tab name="Cursor" >}}
- **Format** : [**Cursor**](https://cursor.com/docs/hooks)
- **Pour aller plus loin** :
  [events](https://cursor.com/docs/hooks#reference),
  [matchers](https://cursor.com/docs/hooks#configuration)

```tree
repository/
└── .cursor/
    └── hooks.json
~/.cursor/
└── hooks.json
<plugin>/
└── .cursor-plugin/
    └── plugin.json
```

```json
{
    "version": 1,
    "hooks": {
        "preToolUse": [
            {
                "command": "./hooks/lint-check.sh",
                "matcher": "Shell"
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format** : [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/hooks)

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
type = "pre_tool"
match = "bash"
command = "node .vibe/hooks/link-check.js"
```

Les hooks de projet se chargent avant les hooks utilisateur, et uniquement dans les dossiers de confiance.
{{< /tab >}}

{{< tab name="Antigravity" >}}
- **Format** : [**Antigravity**](https://antigravity.google/docs/hooks?tab=ide)
- **Pour aller plus loin** :
  [events](https://antigravity.google/docs/hooks?tab=ide#supported-events),
  [matchers](https://antigravity.google/docs/hooks?tab=ide#matcher)

```tree
repository/
└── .agents/
    └── hooks.json
~/.gemini/config/
└── hooks.json
```

```json
{
    "lint-check": {
        "PreToolUse": [
            {
                "matcher": "run_command",
                "hooks": [
                    {
                        "type": "command",
                        "command": "./scripts/lint-check.sh"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format** : [**Devin**](https://docs.devin.ai/cli/extensibility/hooks/overview)
- **Pour aller plus loin** :
  [events](https://docs.devin.ai/cli/extensibility/hooks/overview#hook-events)

```tree
repository/
└── .devin/
    ├── config.json
    ├── config.local.json
    └── hooks.v1.json
~/.config/devin/
└── config.json
~/path/to/locally/installed/plugins/<name>/
└── hooks.json
```

```json
{
    "PreToolUse": [
        {
            "matcher": "exec",
            "hooks": [
                {
                    "type": "command",
                    "command": "./scripts/lint-check.sh",
                    "timeout": 10
                }
            ]
        }
    ]
}
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
- **Format** : [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks)
- **Pour aller plus loin** :
  [events](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks#available-events)

```tree
<plugin>/
├── plugin.yaml
└── __init__.py
```

```python
def register(ctx):
    ctx.register_hook("pre_tool_call", my_pre_tool_call)
    ctx.register_hook("post_tool_call", my_post_tool_call)
    ctx.register_hook("on_session_start", my_on_session_start)
    ctx.register_hook("pre_gateway_dispatch", my_pre_gateway_dispatch)
```
{{< /tab >}}

{{< tab name="OpenCode" >}}
- **Format** : [**OpenCode**](https://opencode.ai/docs/build/plugins/server#hooks)

```tree
repository/
└── .opencode/
    └── plugins/
        └── lint-check.ts
~/.config/opencode/
└── plugins/
    └── lint-check.ts
```

```ts
import { Plugin } from "@opencode/plugin"

export default Plugin.define({
  id: "lint-check",
  async setup(ctx) {
    await ctx.tool.hook("execute.before", (event) => {
      if (event.tool === "read") console.log(event.input)
    })
  },
})
```
{{< /tab >}}

{{< tab name="Pi" >}}
- **Format** : [**Pi**](https://github.com/earendil-works/pi/blob/main/packages/coding-agent/docs/extensions.md#events)

```tree
repository/
└── .pi/
    └── extensions/
        └── lint-check.ts
~/.pi/agent/
└── extensions/
    └── lint-check.ts
```

```ts
import { type ExtensionAPI, isToolCallEventType } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.on("tool_call", async (event, ctx) => {
    if (isToolCallEventType("bash", event) && event.input.command.includes("rm -rf")) {
      const ok = await ctx.ui.confirm("Dangerous!", "Allow rm -rf?");
      if (!ok) return { block: true, reason: "Blocked by user" };
    }
  });
}
```
{{< /tab >}}

{{< /tabs >}}
