---
title: Instruction / Rule
---

Instructions are known to be the global rules an agents must respect when acting,
whether it be practices to apply, how to develop, naming conventions, etc.

But it's not just that, to avoid flooding the context with all instructions specific to languages or file types (markdown, java, go, etc.),
specific instructions files can be created.

By doing that, the agent only has the frontmatter content loading into its context at the beginning of a session
and will only load specific instructions when working with concerned files.

To avoid duplicating instructions between agents or files, `@filepath` references can be used within instructions
to load specific files (e.g. `@README.md`, `@AGENTS.md`).

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/memory#path-specific-rules)
- **Compatibility**: Claude Code

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
- **Format**: [Codex](https://learn.chatgpt.com/docs/agent-configuration/agents-md#how-codex-discovers-guidance)
- **Compatibility**: Copilot, Cursor

```tree
repository/
├── AGENTS.md
└── src/
    └── api/
        └── AGENTS.md
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [Copilot](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions#creating-path-specific-custom-instructions)
- **Compatibility**: Codex CLI, Cursor

```tree
repository/
├── AGENTS.md
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

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/docs/context/rules#rule-anatomy)
- **Compatibility**: Codex, Copilot

```tree
repository/
└── .cursor/
    └── rules/
        └── backend-services.mdc
```

```yaml
---
description: RPC service conventions and patterns for the backend
globs: "src/services/**/*.ts"
alwaysApply: false
---

- Define each service in its own file under `src/services/`.
- Always validate inputs at the service boundary.
```
{{< /tab >}}

{{< /tabs >}}
