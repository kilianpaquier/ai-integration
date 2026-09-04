---
title: Agent (personnalisé)
---

Les sessions gérant des revues, investigations, *builds* ou autres tâches variées, toutes au sein de la même conversation,
peuvent vite saturer le contexte principal.

C'est là que les agents personnalisés (ou sous-agents) entrent en jeu : chacun dédié à un type de tâche,
avec son propre modèle, ses propres accès aux outils et son propre *prompt* système.

Ils délèguent des tâches ou exécutent du travail en parallèle pendant une session sans saturer le contexte principal,
sans avoir à démarrer une nouvelle session avec un agent préconfiguré.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields)

```tree
repository/
└── .claude/
    └── agents/
        └── agent-name.md
~/.claude/
└── agents/
    └── agent-name.md
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── agents/
    └── agent-name.md
```

```yaml
---
name: agent-name
description: What this agent specializes in and when it should be invoked
model: opus # "opus", "sonnet", "haiku", "inherit" ou un ID de modèle précis
tools: Glob, Grep, Read
# many other frontmatter properties
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format** : [**Codex**](https://learn.chatgpt.com/docs/agent-configuration/subagents?surface=app#app-custom-agent-file-schema)

```tree
repository/
└── .codex/
    └── agents/
        └── reviewer.toml
~/.codex/
└── agents/
    └── reviewer.toml
```

```toml
name = "reviewer"
description = "PR reviewer focused on correctness, security, and missing tests."
developer_instructions = """
Review code like an owner. Prioritize correctness, security, and test coverage.
"""
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/reference/custom-agents-configuration#yaml-frontmatter-properties)

```tree
repository/
└── .github/
    └── agents/
        └── agent-name.agent.md
~/.copilot/
└── agents/
    └── agent-name.agent.md
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── agents/
    └── agent-name.agent.md
```

```yaml
---
name: agent-name
description: What this agent specializes in and when it should be invoked
model: Claude Opus 5, GPT-5.6 Sol # une liste de modèles, le premier disponible sera utilisé
tools: read, search # accepte aussi les valeurs de Claude Code
# many other frontmatter properties
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

{{< tab name="Cursor" >}}
- **Format** : [**Cursor**](https://cursor.com/docs/subagents)

```tree
repository/
└── .cursor/
    └── agents/
        └── reviewer.md
~/.cursor/
└── agents/
    └── reviewer.md
```

```yaml
---
name: reviewer
description: What this agent specializes in and when it should be invoked
model: inherit # "inherit" ou un ID de modèle précis
readonly: true # empêche les modifications de fichiers et les commandes shell avec état
is_background: false
---

Prompt système détaillé décrivant le rôle, l'expertise et le comportement de l'agent.
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format** : [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/agents#custom-agents)

```tree
repository/
└── .vibe/
    ├── agents/
    │   └── developer.toml
    └── prompts/
        └── developer.md
~/.vibe/
├── agents/
│   └── reviewer.toml
└── prompts/
    └── reviewer.md
```

```toml
agent_type = "subagent" # "agent" (user-selectable) or "subagent" (delegation-only)
display_name = "Reviewer"
description = "Read-only subagent for code review."
system_prompt_id = "reviewer" # must point to a valid prompts/<id>.md
```
{{< /tab >}}

{{< tab name="Antigravity" >}}
- **Format** : [**Antigravity**](https://antigravity.google/docs/subagents/)

```tree
repository/
└── .agents/
    └── agents/
        ├── reviewer.md
        └── developer/
            └── agent.md
~/.gemini/config/
└── agents/
    ├── reviewer.md
    └── developer/
        └── agent.md
~/.gemini/antigravity-cli/plugins/<plugin>/
└── agents/
    └── reviewer.md
```

```yaml
---
name: reviewer
description: What this agent specializes in and when it should be invoked
subagent: true
mainAgent: false
model: pro # "inherit", "flash", or "pro"
commandExecutionPolicy: sandbox # "off", "auto", "eager", or "sandbox"
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format** : [**Devin**](https://docs.devin.ai/cli/subagents)

```tree
repository/
└── .devin/
    └── agents/
        ├── reviewer.md
        └── developer/
            └── AGENT.md
~/.config/devin/
└── agents/
    ├── reviewer.md
    └── developer/
        └── AGENT.md
~/path/to/locally/installed/plugins/<name>/
└── agents/
    └── reviewer.md
```

```yaml
---
name: reviewer
description: What this agent specializes in and when it should be invoked
model: sonnet
allowed-tools: [glob, grep, read]
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

{{< /tabs >}}
