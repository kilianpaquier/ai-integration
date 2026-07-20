---
title: Model Context Protocol
---

Lorsqu'il a besoin de documentation concernant des outils, des fonctionnalités de langage, des interactions avec des plateformes
(**Jira**, **GitHub**, **GitLab** et bien d'autres), etc., un agent utilisera soit ses informations d'entraînement,
lançera des recherches ou exécutera des requêtes (via des outils, `curl`, `wget`, etc.).

Les requêtes et recherches renvoient une quantité variable d'informations qui ne seront probablement pas utiles pour la suite
de la session, saturant le contexte.

C'est là que les [**Model Context Protocols (MCP)**](https://modelcontextprotocol.io/docs/getting-started/intro) entrent en jeu,
facilitant l'interaction avec le monde extérieur (c'est-à-dire en dehors de votre dépôt) :
bases de données, tickets **Jira**, recherche de code **GitHub** ou **GitLab**, documentation à jour, designs **Figma**, etc.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> Ce format ne peut être fourni que via des [plugins](/share/plugin).

- **Format** : [**Open Plugin**](https://open-plugins.com/agent-builders/components/mcp-servers)

```tree
repository/
└── .mcp.json
```

```json
{
    "mcpServers": {
        "context7": {
            "command": "npx",
            "args": ["-y", "@upstash/context7-mcp"]
        }
    }
}
```
{{< /tab >}}

{{< tab name="Claude Code" >}}
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/mcp#project-scope)

```tree
repository/
└── .mcp.json
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── .mcp.json
```

```json
{
    "mcpServers": {
        "context7": {
            "command": "npx",
            "args": ["-y", "@upstash/context7-mcp"]
        }
    }
}
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format** : [**Codex**](https://learn.chatgpt.com/docs/extend/mcp?surface=app#app-other-configuration-options)

```tree
repository/
└── .codex/
    └── config.toml
~/.codex/plugins/cache/<marketplace>/<plugin>/<version>/
└── .mcp.json
```

```toml
[mcp_servers.context7]
command = "npx"
args = ["-y", "@upstash/context7-mcp"]
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-mcp-servers#editing-the-configuration-file)

```tree
~/.copilot/
└── mcp-config.json
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── .mcp.json
```

```json
{
    "mcpServers": {
        "context7": {
            "type": "http",
            "url": "https://mcp.context7.com/mcp"
        },
        "playwright": {
            "type": "local",
            "command": "npx",
            "args": ["@playwright/mcp@latest"]
        }
    }
}
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format** : [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/mcp-servers#common-fields)

```tree
repository/
└── .vibe/
    └── config.toml
```

```toml
[[mcp_servers]]
name = "context7"
transport = "stdio"
command = "npx"
args = ["-y", "@upstash/context7-mcp"]

[[mcp_servers]]
name = "my_http_server"
transport = "http"
url = "http://localhost:8000"
```
{{< /tab >}}

{{< /tabs >}}
