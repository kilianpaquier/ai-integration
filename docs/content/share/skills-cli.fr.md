---
description: Un seul CLI pour télécharger toutes les skills du monde.
title: Skills CLI
weight: 10
---

Le [**Skills CLI**](https://github.com/vercel-labs/skills) télécharge n'importe quel *skill*
depuis des dépôts Git, à condition qu'il respecte le standard [**Agent Skills**](https://agentskills.io)
(plus d'informations dans [components](/components/skill)).

Les *skills* peuvent être découverts depuis [différents emplacements](https://github.com/vercel-labs/skills#skill-discovery)
au sein des dépôts Git, et le CLI est compatible avec les *skills* définis dans les [plugins](/share/plugin).

## Utilisation

Le Skills CLI n'a besoin que de `npx` pour être utilisé, peut installer des *skills* à l'échelle du dépôt ou de l'utilisateur,
et supporte [beaucoup d'agents](https://github.com/vercel-labs/skills#supported-agents).

```sh
mise use -g npx
npx skills add <repository_path>
```

## Fichier de verrouillage

Chaque installation est tracée dans un fichier de verrouillage afin que les équipes utilisent exactement les mêmes *skills*
et versions (similaire à `package-lock.json`).

Échelle utilisateur (flag `-g`) :

```tree
~/.agents/
  └── .skill-lock.json
```

Échelle dépôt (par défaut), destiné à être commité :

```tree
repository/
└── skills-lock.json
```

## Explorer

L'écosystème des *skills* peut être découvert et exploré via [skills.sh](https://www.skills.sh/), mais comme expliqué au début,
même des *skills* ou dépôts non référencés peuvent être utilisés (par exemple des *skills* privés).

## Limitations

- Seuls des *skills* peuvent être installés par le CLI, limitant l'optimisation des agents.
- Les *skills* installés avec le CLI n'ont pas de *namespace* (par exemple `/plugin:skill-name`) et sont donc susceptibles aux conflits de nommage.
