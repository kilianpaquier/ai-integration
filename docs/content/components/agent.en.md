---
title: (Custom) Agent
---

Sessions handling review, investigation, build, or other varied tasks all within the same conversation
can quickly flood the main context.

That's when custom agents (or subagents) come into play: each dedicated to one task type,
with its own model, tool access and system prompt.

They allow delegating tasks or running parallel work during a session without flooding the main context,
or without having to initiate a new session with a pre-configured agent.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> This format can only be provided within [plugins](/share/plugin).

- **Format**: [**Open Plugin**](https://open-plugins.com/agent-builders/components/agents)

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
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields)

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
- **Format**: [**Codex**](https://learn.chatgpt.com/docs/agent-configuration/subagents?surface=app#app-custom-agent-file-schema)

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
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/reference/custom-agents-configuration#yaml-frontmatter-properties)

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
- **Format**: [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/agents#custom-agents)

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
