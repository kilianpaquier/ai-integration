---
title: Instruction / Règle
---

Les instructions sont les règles globales qu'un agent doit respecter lorsqu'il agit,
qu'il s'agisse de pratiques à appliquer, de la façon de développer, de conventions de nommage, etc.

Mais ce n'est pas que ça : pour éviter de saturer le contexte avec toutes les instructions spécifiques
aux langages ou types de fichiers (markdown, java, go, etc.), des fichiers d'instructions spécifiques peuvent être créés.

En procédant ainsi, l'agent ne charge dans son contexte que le contenu du frontmatter au début d'une session,
et ne charge les instructions spécifiques que lorsqu'il travaille avec les fichiers concernés.

Pour éviter de dupliquer des instructions entre agents ou fichiers, des références `@filepath` peuvent être utilisées
dans les instructions pour charger des fichiers spécifiques (par exemple `@README.md`, `@AGENTS.md`).

{{< tabs >}}

{{< tab name="AGENTS.md" >}}
> [!important]
> Standard neutre de l'[Agentic AI Foundation](https://aaif.io/).

- **Format** : [**AGENTS.md**](https://agents.md/)
- **Lu par** : **Codex**, **Copilot**, **Mistral Vibe**

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Open Plugin" >}}
> [!note]
> Ce format ne peut être fourni que via des [plugins](/share/plugin).

- **Format** : [**Open Plugin**](https://open-plugins.com/agent-builders/components/rules)

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
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/memory#path-specific-rules)

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
- **Format** : [**Codex**](https://learn.chatgpt.com/docs/agent-configuration/agents-md#how-codex-discovers-guidance)

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
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions#creating-path-specific-custom-instructions)

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
- **Format** : [**Mistral Vibe**](https://github.com/mistralai/mistral-vibe/blob/main/README.md#custom-system-prompts)

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
