---
title: Instruction / Rule
---

Instructions are known to be the global rules an agent must respect when acting,
whether it be practices to apply, how to develop, naming conventions, etc.

But it's not just that: to avoid flooding the context with all instructions specific to languages or file types (markdown, java, go, etc.),
specific instruction files can be created.

By doing that, the agent only loads the frontmatter content into its context at the beginning of a session,
and loads specific instructions only when working with the concerned files.

To avoid duplicating instructions between agents or files, `@filepath` references can be used within instructions
to load specific files (e.g. `@README.md`, `@AGENTS.md`).

{{< tabs >}}

{{< tab name="AGENTS.md" >}}
> [!important]
> Neutral standard from the [Agentic AI Foundation](https://aaif.io/).

- **Format**: [**AGENTS.md**](https://agents.md/)
- **Read by**: **Codex**, **Copilot**, **Mistral Vibe**

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Open Plugin" >}}
> [!note]
> This format can only be provided within [plugins](/share/plugin).

- **Format**: [**Open Plugin**](https://open-plugins.com/agent-builders/components/rules)

```tree
repository/
└── rules/
    └── prefer-const.mdc
```

```yaml
---
description: Prefer const over let. Never use var.
alwaysApply: true
globs: "**/*.{js,ts,jsx,tsx}"
---

Always use `const` for variables that are never reassigned.
Use `let` only when reassignment is necessary. Never use `var`.
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/memory#path-specific-rules)

```tree
repository/
├── CLAUDE.md
└── .claude/
    └── rules/
        ├── code-style.md
        └── api.md
```

```yaml
---
paths: ["src/api/**/*.ts"]
---

List of rules to respect for TypeScript API files
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [**Codex**](https://learn.chatgpt.com/docs/agent-configuration/agents-md#how-codex-discovers-guidance)

```tree
repository/
├── AGENTS.md
└── src/
    └── api/
        └── AGENTS.md
~/.codex/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions#creating-path-specific-custom-instructions)

```tree
repository/
├── AGENTS.md
├── CLAUDE.md
├── GEMINI.md
└── .github/
    ├── copilot-instructions.md
    └── instructions/
        └── ruby-models.instructions.md
```

```yaml
---
applyTo: "app/models/**/*.rb"
excludeAgent: code-review
---

Handle Ruby model files matching this pattern with the project's ActiveRecord conventions.
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [**Mistral Vibe**](https://github.com/mistralai/mistral-vibe/blob/main/README.md#custom-system-prompts)

```tree
repository/
├── AGENTS.md
└── src/
    └── api/
        └── AGENTS.md
~/.vibe/
└── AGENTS.md
```
{{< /tab >}}

{{< /tabs >}}
