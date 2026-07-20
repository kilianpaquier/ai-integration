---
description: Regroupez davantage de composants que les plugins en un seul.
title: Package
weight: 40
---

Un *package* est un dépôt Git capable de partager d'un coup un ensemble de composants.

Les *packages* peuvent être installés via l'[**Agent Package Manager**](/share/apm), un CLI simple qui installe, met à jour,
et suit les *packages* installés dans les dépôts ou à l'échelle utilisateur sur une machine.

Les *packages* peuvent aussi être distribués via des [plugins](/share/plugin) ou des [marketplaces](/share/marketplace),
voir [distribution](#distribution) ci-dessous.

## Structure

Un [package](https://microsoft.github.io/apm/producer/author-primitives/) est identifié par son `apm.yml`,
qui définit ses dépendances (autres *packages*, serveurs MCP, serveurs LSP).
Les composants distribués sont placés sous le répertoire `.apm`.

```tree
repository/
├── apm.yml
└── .apm/
    ├── agents/
    │   └── architect.agent.md
    ├── hooks/
    │   └── pre-tool.json
    ├── instructions/
    │   └── style.instructions.md
    ├── prompts/
    │   └── review.prompt.md
    └── skills/
        └── my-skill/
            └── SKILL.md
```

> [!warning]
> Le répertoire `.apm` doit toujours être présent dans un *package* pour que `apm install` fonctionne (un `.gitkeep` suffit).

## Distribution

Comme indiqué ci-dessus, les *packages* peuvent être distribués via des plugins ou des marketplaces à l'aide de la commande `apm pack`.
Les composants incompatibles sont automatiquement filtrés lors de l'[installation côté consommateur](/share/apm#usage) (par exemple les instructions).

```sh
mise use -g apm
apm pack
```

{{< tabs >}}

{{< tab name="Plugin" >}}
> [!warning]Limitation
> Actuellement, seuls les formats **Claude Code** et **Copilot** sont supportés pour la distribution de plugins.
> Mais cela ne signifie pas que les autres agents ne peuvent pas consommer de plugins, ils ont juste besoin de [supporter ces formats](/share/plugin).

En fournissant la propriété `target(s)` dans le `apm.yml`, un fichier `plugin.json` est automatiquement généré.

```yaml
name: example
version: 0.1.0

author: Author Name
description: Package example
license: <LICENSE>

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```
{{< /tab >}}

{{< tab name="Marketplace" >}}
> [!warning]Limitation
> Actuellement, seuls les formats **Claude Code** et **Codex** sont supportés pour la création des manifestes des marketplaces.
> Mais cela ne signifie pas que les autres agents ne peuvent pas les utiliser, ils ont juste besoin de [supporter ces formats](/share/marketplace).

En fournissant une définition `marketplace` dans le `apm.yml`, un fichier `marketplace.json` est automatiquement généré.

```yaml
name: my-project
version: 1.0.0
description: Curated plugins for project

marketplace:
  owner:
    name: owner-name
    url: https://github.com/owner-name
  outputs:
    claude: {}
    codex: {}
  packages:
    - category: <CATEGORY> # needed when generating a codex marketplace.json
      name: example-package
      description: Human-readable description consumers see
      source: ./packages/example-package
```
{{< /tab >}}

{{< /tabs >}}
