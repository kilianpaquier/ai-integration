---
title: Monitor
---

Les processus longs ou externes (par exemple un déploiement en cours, un fichier de log qui grossit, un *healthcheck* interrogé
périodiquement) restent invisibles pour un agent tant que l'utilisateur ne lui demande pas explicitement à leur sujet.

C'est là que les *monitors* entrent en jeu : une commande shell que l'agent démarre automatiquement,
avec chaque ligne de sortie standard qu'elle produit renvoyée sous forme de notification pendant la session.

> [!warning]
> Les *monitors* ne peuvent pour l'instant être définis que via des [plugins](/share/plugin).

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/plugins-reference#monitors)

```tree
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── monitors/
    └── monitors.json
```

```json
[
    {
        "name": "deploy-status",
        "command": "\"${CLAUDE_PLUGIN_ROOT}\"/scripts/poll-deploy.sh ${user_config.api_endpoint}",
        "description": "Deployment status changes"
    },
    {
        "name": "error-log",
        "command": "tail -F ./logs/error.log",
        "description": "Application error log",
        "when": "on-skill-invoke:debug"
    }
]
```
{{< /tab >}}

{{< /tabs >}}
