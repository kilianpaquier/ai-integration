---
title: Language Server Protocol
---

Les **Language Server Protocol (LSP)** [existaient déjà](https://microsoft.github.io/language-server-protocol)
bien avant l'arrivée de l'IA.
C'est exactement ce qui est exécuté pour obtenir l'*IntelliSense* lors du développement dans IntelliJ, Zed, VSCode,
ou autre éditeur de code.

Lorsqu'un agent édite du code, il ne voit qu'un fichier et prédit comment il doit être écrit en se basant sur sa compréhension
du format (par exemple un `.java`, etc.), des fichiers du projet (car l'agent les a lus), et de la demande de l'utilisateur.

Pour contrer un potentiel code invalide et faciliter la navigation dans le code, les LSP peuvent être connectés aux agents,
et comme les [MCP](/components/mcp), ils offrent l'accès à des outils, par exemple pour vérifier que le code compile
ou trouver ce qui appelle une fonction.

Combiné à l'[indexation des projets](/tooling/code-indexing), un agent peut naviguer dans le code bien plus rapidement
et trouver ce dont il a besoin pour accomplir sa (ou ses) tâche(s).

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> Ce format ne peut être fourni que via des [plugins](/share/plugin).

- **Format** : [**Open Plugin**](https://open-plugins.com/agent-builders/components/lsp-servers)

```tree
repository/
└── .lsp.json
```

```json
{
    "go": {
        "command": "gopls",
        "extensionToLanguage": { ".go": "go" }
    }
}
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/plugins-reference#lsp-servers)

```tree
repository/
└── .lsp.json
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── .lsp.json
```

```json
{
    "go": {
        "command": "gopls",
        "extensionToLanguage": { ".go": "go" },
        "startupTimeout": 120000
    }
}
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/add-lsp-servers#configuration-fields)

```tree
repository/
└── .github/
    └── lsp.json
~/.copilot/
└── lsp-config.json
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── lsp.json
```

```json
{
    "lspServers": {
      "go": {
          "command": "gopls",
          "fileExtensions": { ".go": "go" },
          "requestTimeoutMs": 90000
      }
    }
}
```
{{< /tab >}}

{{< /tabs >}}
