---
title: Model Context Protocol
---

When in need of documentation regarding tools, languages features, interactions with platforms (Jira, GitHub, GitLab), etc. an agent will either use
it's training informations run *raw* searches or fetches (through tools or `curl`).

Fetches and searches returns a variable number of information that will not be useful for the session going forward.
This adds unnecessary context informations.

That's when Model Context Protocols (MCP) enter the dance, with them interaction with outside repository files is eased,
databases, Jira issues, GitHub or GitLab code search, up-to-date documentation, etc.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/mcp#project-scope)
- **Compatibility**: Claude Code

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
- **Format**: [Codex](https://learn.chatgpt.com/docs/extend/mcp#configure-with-config-toml)
- **Compatibility**: Codex

```tree
.codex/
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
- **Format**: [Copilot](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-mcp-servers#editing-the-configuration-file)
- **Compatibility**: Copilot

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

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/docs/context/mcp#project-configuration)
- **Compatibility**: Cursor

```tree
.cursor/
└── mcp.json
~/.cursor/
└── mcp.json
```

```json
{
    "mcpServers": {
        "context7": {
            "type": "stdio",
            "command": "npx",
            "args": ["-y", "@upstash/context7-mcp"]
        }
    }
}
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [Mistral Vibe](https://docs.mistral.ai/vibe/code/cli/mcp-servers#common-fields)
- **Compatibility**: Mistral Vibe

```tree
.vibe/
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
