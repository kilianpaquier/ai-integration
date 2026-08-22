---
title: Instruction / Règle
---

Les instructions sont les règles globales qu'un agent doit respecter lorsqu'il agit,
qu'il s'agisse de pratiques à appliquer, de la façon de développer, de conventions de nommage, etc.

Mais ce n'est pas que ça : pour éviter de saturer le contexte avec toutes les instructions spécifiques
aux langages ou types de fichiers (markdown, java, go, etc.), des fichiers d'instructions spécifiques peuvent être créés.

En procédant ainsi, l'agent *runtime* ne charge dans son contexte que le contenu du frontmatter au début d'une session,
et ne charge les instructions spécifiques que lorsqu'il travaille avec les fichiers concernés.

Pour éviter de dupliquer des instructions entre agent *runtimes* ou fichiers, des références `@filepath` peuvent être utilisées
dans les instructions pour charger des fichiers spécifiques (par exemple `@README.md`, `@AGENTS.md`).

{{< tabs >}}

{{< tab name="AGENTS.md" >}}
> [!important]
> Standard neutre de l'[Agentic AI Foundation](https://aaif.io/).

- **Format** : [**AGENTS.md**](https://agents.md/)
- **Lu par** : **Codex**, **Copilot**, **Cursor**, **Mistral Vibe**, **Devin**, **Antigravity**

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/memory#path-specific-rules)

```tree
repository/
├── CLAUDE.md
└── .claude/
    └── rules/
        └── code-style.md
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

{{< tab name="Cursor" >}}
- **Format** : [**Cursor**](https://cursor.com/docs/rules)

```tree
repository/
├── AGENTS.md
└── .cursor/
    └── rules/
        └── code-style.mdc
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

{{< tab name="Antigravity" >}}
- **Format** : [**Antigravity**](https://antigravity.google/docs/rules-workflows/)

```tree
repository/
├── AGENTS.md
├── GEMINI.md
└── .agents/
    └── rules/
        └── code-style.md
~/.gemini/
└── GEMINI.md
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format** : [**Devin**](https://docs.devin.ai/onboard-devin/agents-md)

```tree
repository/
└── AGENTS.md
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
- **Format** : [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/user-guide/features/context-files)

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

Priorité : `.hermes.md` > `AGENTS.override.md` > `AGENTS.md` > `CLAUDE.md` > `.cursorrules`.
{{< /tab >}}

{{< /tabs >}}
