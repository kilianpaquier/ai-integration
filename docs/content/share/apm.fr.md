---
description: Un seul CLI et de nombreux packages pour partager des composants.
title: Agent Package Manager
weight: 50
---

L'[**Agent Package Manager**](https://github.com/microsoft/apm) (APM) installe des [packages](/share/package),
des [plugins](/share/plugin) (directement) ou via des [marketplaces](/share/marketplace).

Contrairement aux plugins installés nativement par chaque agent, le CLI APM se charge de placer les composants au bon endroit
pour chaque agent, afin qu'ils puissent être utilisés sans configuration supplémentaire (`.agents`, `.claude`, `.copilot`, `.github`, etc.),
élargissant ainsi la compatibilité entre agents.

## Utilisation

L'installation peut se faire au sein de dépôts (pour avoir des dépendances ou plugins limités à un dépôt)
ou à l'échelle utilisateur. La gestion de la portée se fait via le flag `--global` / `-g`.

Pour installer des composants pour des agents spécifiques uniquement,
utilisez la propriété [`target(s)`](https://microsoft.github.io/apm/reference/targets-matrix/).

{{< tabs >}}

{{< tab name="Package" >}}
Installez n'importe quel *package* [depuis n'importe où](https://microsoft.github.io/apm/consumer/manage-dependencies/#reference-formats)
(dépôt Git, répertoire local, composant distant, etc.).

```sh
mise use -g apm
apm install <path_to_primitive>
apm install --mcp <path_to_primitive>
```

```yaml
name: my-project
version: 0.1.0
description: Dependencies for project

dependencies:
  apm: []
  mcp: []
  lsp: []

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```

{{< /tab >}}

{{< tab name="Plugin" >}}
> [!note]
> L'installation de plugin ne doit être considérée que comme une fonctionnalité de rétrocompatibilité
> pour les plugins (ou marketplaces) existants sans manifest APM (pas de `apm.yml` ni de `.apm`).

Installez n'importe quel plugin depuis n'importe quel marketplace, à l'échelle utilisateur ou dépôt.

```sh
mise use -g apm
apm marketplace add <owner>/<repo>
apm install <package-name>@<marketplace-name>
```
{{< /tab >}}

{{< /tabs >}}

## Fichier de verrouillage

Chaque installation est tracée dans un fichier de verrouillage afin que les équipes utilisent exactement les mêmes dépendances
et plugins (similaire à `package-lock.json`).

Échelle utilisateur (flag `-g`) :

```tree
~/.apm/
  └── apm.lock.yaml
```

Échelle dépôt (par défaut), destiné à être commité :

```tree
repository/
└── apm.lock.yaml
```

## Limitations

> [!warning]Espace de nommage
> Les composants de type *slash* installés avec APM n'ont pas de *namespace* (par exemple `/plugin:skill-name`)
> et sont donc susceptibles aux [conflits de nommage](https://github.com/microsoft/apm/issues/739).
