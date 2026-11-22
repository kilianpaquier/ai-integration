---
title: Instruction / Rule
---

Instructions are known to be the global rules an agent must respect when acting,
whether it be practices to apply, how to develop, naming conventions, etc.

But it's not just that: to avoid flooding the context with all instructions specific to languages or file types (markdown, java, go, etc.),
specific instruction files can be created.

By doing that, the agent runtime only loads the frontmatter content into its context at the beginning of a session,
and loads specific instructions only when working with the concerned files.

To avoid duplicating instructions between agent runtimes or files, `@filepath` references can be used within instructions
to load specific files (e.g. `@README.md`, `@AGENTS.md`).

{{< tabs >}}

{{< tab name="AGENTS.md" >}}
> [!important]
> Neutral standard from the [Agentic AI Foundation](https://aaif.io/).

- **Format**: [**AGENTS.md**](https://agents.md/)
- **Read by**: **Codex**, **Copilot**, **Claude Code**, **Cursor**, **Mistral Vibe**, **Devin**, **Antigravity**, **OpenCode**, **Pi**, **Hermes Agent**

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/memory#path-specific-rules)

```tree
repository/
├── AGENTS.md
├── CLAUDE.md
└── .claude/
    └── rules/
        └── code-style.md
~/.claude/
├── CLAUDE.md
└── rules/
    └── code-style.md
```

**Claude Code** reads `AGENTS.md` only when no `CLAUDE.md` exists.

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
├── AGENTS.override.md
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
~/.copilot/
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
- **Format**: [**Cursor**](https://cursor.com/docs/rules)

```tree
repository/
├── AGENTS.md
├── .cursor/
│   └── rules/
│       └── code-style.mdc
└── src/
    └── api/
        └── AGENTS.md
```

```yaml
---
description: Rules for TypeScript API files
globs: src/api/**/*.ts
alwaysApply: false
---

List of rules to respect for TypeScript API files
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/agents)

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

{{< tab name="Antigravity" >}}
- **Format**: [**Antigravity**](https://antigravity.google/docs/rules)

```tree
repository/
├── AGENTS.md
├── GEMINI.md
└── .agents/
    └── rules/
        └── code-style.md
~/.gemini/
├── AGENTS.md
├── GEMINI.md
└── config/
    ├── AGENTS.md
    └── GEMINI.md
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format**: [**Devin**](https://docs.devin.ai/onboard-devin/agents-md)

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
- **Format**: [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/user-guide/features/context-files)

```tree
repository/
├── .hermes.md
├── AGENTS.override.md
├── AGENTS.md
├── CLAUDE.md
├── .cursorrules
└── src/
    └── api/
        └── AGENTS.md
~/.hermes/
└── SOUL.md
```

Precedence: `.hermes.md` > `AGENTS.override.md` > `AGENTS.md` > `CLAUDE.md` > `.cursorrules`.
{{< /tab >}}

{{< tab name="OpenCode" >}}
- **Format**: [**OpenCode**](https://opencode.ai/docs/instructions)

```tree
repository/
├── AGENTS.md
└── src/
    └── api/
        └── AGENTS.md
~/.config/opencode/
└── AGENTS.md
```

In a directory without `AGENTS.md`, **OpenCode** reads `CLAUDE.md`, and without a global `AGENTS.md`, it reads `~/.claude/CLAUDE.md`.
{{< /tab >}}

{{< tab name="Pi" >}}
- **Format**: [**Pi**](https://github.com/earendil-works/pi/blob/main/packages/coding-agent/docs/configuration.md#context-files)

```tree
repository/
├── AGENTS.md
├── CLAUDE.md
└── .pi/
    ├── SYSTEM.md
    └── APPEND_SYSTEM.md
~/.pi/agent/
├── AGENTS.md
├── SYSTEM.md
└── APPEND_SYSTEM.md
```

The `SYSTEM.md` file replaces **Pi**'s default system prompt, while `APPEND_SYSTEM.md` adds to it.
{{< /tab >}}

{{< /tabs >}}
