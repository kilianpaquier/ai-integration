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

{{< tab name="Open Plugin" >}}
> [!note]
> Ce format ne peut être fourni que via des [plugins](/share/plugin).

- **Format** : [**Open Plugin**](https://open-plugins.com/agent-builders/components/agents)

```tree
repository/
└── agents/
    └── agent-name.md
```

```yaml
---
name: agent-name
description: What this agent specializes in and when it should be invoked
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

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
# many other frontmatter properties
---

Detailed system prompt for the agent describing its role, expertise and behavior.
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

{{< /tabs >}}
