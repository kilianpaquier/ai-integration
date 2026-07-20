---
title: Skill
---

Dans leurs tâches, les agents peuvent avoir besoin de gérer des actions plus petites et spécifiques : transformer un fichier,
construire un message de commit, résumer quelque chose, etc.
Ces mêmes actions sont parfois aussi nécessaires aux utilisateurs, mais à la demande plutôt que dans le cadre d'une tâche autonome.

C'est là que les *skills* entrent en scène : des recettes utilisables à la fois par les utilisateurs et les machines,
tout en gardant la possibilité de restreindre leur usage à l'un ou l'autre.

{{< tabs >}}

{{< tab name="Agent Skills" >}}
> [!note]
> Dans ce format, les skills doivent tout de même être placés sous le bon répertoire d'agent (par exemple `.agents`, `.claude`, `.vibe`).

- **Format** :
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
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/skills#frontmatter-reference)
- **Compatibilité** : **Copilot** (niveau dépôt uniquement)

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
- **Format** : [**Codex**](https://learn.chatgpt.com/docs/build-skills#optional-metadata)

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
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills#example-skillmd-file)

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
- **Format** : [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/skills#skill-format)

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
