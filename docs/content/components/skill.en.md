---
title: Skill
---

*In the beginning there were commands and prompts, then skills.*

Within their tasks, agents may need to know how to handle specific smaller actions: transforming a file,
building a commit message, summarizing whatever, etc. Sometimes users may also need to run such actions themselves.

That's when skills enter the picture: small recipes usable by both users and machines, while still allowing usage
to be restricted to either one of them.

{{< tabs >}}

{{< tab name="Agent Skills" >}}
> [!note]
> Skills must still be placed under the right agent directory in this format (e.g. `.agents`, `.claude`, `.vibe`).

- **Format**:
  [**Agent Skills**](https://agentskills.io/specification),
  [**Open Plugin**](https://open-plugins.com/agent-builders/components/skills)

```tree
skill-name/
├── SKILL.md
├── scripts/
├── references/
└── assets/
```

```yaml
---
name: schema-to-go
description: A skill that converts JSON Schema to Go struct definitions.
# other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/skills#frontmatter-reference)
- **Compatibility**: **Copilot** (only repository level)

```tree
repository/
└── .claude/
    └── skills/
        └── skill-name/
            ├── SKILL.md
            ├── reference.md
            └── scripts/
~/.claude/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── skills/
    └── skill-name/
        └── SKILL.md
```

```yaml
---
name: schema-to-go
description: A skill that converts JSON Schema to Go struct definitions.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [**Codex**](https://learn.chatgpt.com/docs/build-skills#optional-metadata)

```tree
repository/
└── .agents/
    └── skills/
        └── skill-name/
            ├── SKILL.md
            └── agents/
                └── openai.yaml
~/.agents/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.codex/plugins/cache/<marketplace>/<plugin>/<version>/
└── skills/
    └── skill-name/
        └── SKILL.md
```

```yaml
---
name: schema-to-go
description: A skill that converts JSON Schema to Go struct definitions.
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills#example-skillmd-file)

```tree
repository/
├── .agents/
│   └── skills/
│       └── skill-name/
│           └── SKILL.md
└── .github/
    └── skills/
        └── skill-name/
            └── SKILL.md
~/.agents/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.copilot/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── skills/
    └── skill-name/
        └── SKILL.md
```

```yaml
---
name: schema-to-go
description: A skill that converts JSON Schema to Go struct definitions.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/skills#skill-format)

```tree
repository/
├── .agents/
│   └── skills/
│       └── skill-name/
│           └── SKILL.md
└── .vibe/
    └── skills/
        └── skill-name/
            └── SKILL.md
~/.vibe/
└── skills/
    └── skill-name/
        └── SKILL.md
```

```yaml
---
name: schema-to-go
description: A skill that converts JSON Schema to Go struct definitions.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< /tabs >}}
