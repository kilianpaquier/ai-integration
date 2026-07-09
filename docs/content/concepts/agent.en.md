---
title: (Custom) Agent
---

A custom agent (or subagent) is expected to be dedicated to one task type (review, investigation, build, etc.),
with its own model, tool access and system prompt.

Its usefulness enters into account to delegate tasks or run parallel tasks during a session without flooding the main context
or initiating a new session with a pre-destined agent.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields)
- **Compatibility**: Cursor (additional compatibility to be verified)

```tree
.claude/
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
- **Format**: [Codex](https://learn.chatgpt.com/docs/agent-configuration/subagents?surface=app#app-custom-agent-file-schema)
- **Compatibility**: Cursor (additional compatibility to be verified)

```tree
.codex/
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
- **Format**: [Copilot](https://docs.github.com/en/copilot/reference/custom-agents-configuration#yaml-frontmatter-properties)
- **Compatibility**: Copilot

```tree
.github/
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

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/fr/docs/subagents#champs-de-configuration)
- **Compatibility**: Cursor

```tree
.cursor/
└── agents/
    └── agent-name.md
~/.cursor/
└── agents/
    └── agent-name.md
~/.cursor/plugins/local/<plugin>/
└── agents/
    └── agent-name.md
```

```yaml
---
name: agent-name
description: What this agent specializes in and when it should be invoked
model: inherit
readonly: false
---

Detailed system prompt for the agent describing its role, expertise and behavior.
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [Mistral Vibe](https://docs.mistral.ai/vibe/code/cli/agents#custom-agents)
- **Compatibility**: Mistral Vibe

```tree
.vibe/
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
