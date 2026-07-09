---
title: Skill
---

TBD

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/skills#frontmatter-reference)
- **Compatibility**: Copilot, Cursor (additional compatibility to be verified)

```tree
.claude/
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
name: csv-to-json
description: A skill that converts CSV files to JSON documents.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [Codex](https://learn.chatgpt.com/docs/build-skills#optional-metadata)
- **Compatibility**: Copilot, Cursor, Mistral Vibe (additional compatibility to be verified)

```tree
.agents/
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
name: csv-to-json
description: A skill that converts CSV files to JSON documents.
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [Copilot](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills#example-skillmd-file)
- **Compatibility**: Copilot

```tree
.github/
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
name: csv-to-json
description: A skill that converts CSV files to JSON documents.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/docs/context/skills#skill-directories)
- **Compatibility**: Codex, Copilot, Mistral Vibe (additional compatibility to be verified)

```tree
.agents/
└── skills/
    └── skill-name/
        └── SKILL.md
.cursor/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.agents/
└── skills/
    └── skill-name/
        └── SKILL.md
~/.cursor/
└── skills/
    └── skill-name/
        └── SKILL.md
```

```yaml
---
name: csv-to-json
description: A skill that converts CSV files to JSON documents.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [Mistral Vibe](https://docs.mistral.ai/vibe/code/cli/skills#skill-format)
- **Compatibility**: Mistral Vibe

```tree
.vibe/
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
name: csv-to-json
description: A skill that converts CSV files to JSON documents.
# many other frontmatter properties
---

Skill instructions body (the prompt the agent follows when invoked).
```
{{< /tab >}}

{{< /tabs >}}
