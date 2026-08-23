---
title: MCP
---

When in need of documentation regarding tools, language features, interactions with platforms (**Jira**, **GitHub**, **GitLab** and many more), etc.,
an agent runtime will either use its training information, or run searches or fetches (through tools, `curl`, `wget`, etc.).

Fetches and searches return a variable amount of information that will probably not be useful for the session going forward, flooding the context.

That's when [**Model Context Protocols (MCP)**](https://modelcontextprotocol.io/docs/getting-started/intro) enter the dance,
easing interaction with the outside world (i.e. outside your repository):
databases, **Jira** issues, **GitHub** or **GitLab** code search, up-to-date documentation, **Figma** designs, etc.

{{< tabs >}}

{{< tab name="Agent Plugins" >}}
> [!note]
> This format can only be provided within [plugins](/share/plugin).

- **Format**: [**Agent Plugins**](https://agent-plugins.org/plugin-authors/mcp-servers)

```tree
repository/
└── mcp.json
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
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/mcp#project-scope)

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
- **Format**: [**Codex**](https://learn.chatgpt.com/docs/extend/mcp?surface=app#app-other-configuration-options)

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
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-mcp-servers#editing-the-configuration-file)

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
- **Format**: [**Mistral Vibe**](https://docs.mistral.ai/vibe/code/cli/mcp-servers#common-fields)

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

{{< tab name="Antigravity" >}}
- **Format**: [**Antigravity**](https://antigravity.google/docs/cli/mcp/)

```tree
repository/
└── .agents/
    └── mcp_config.json
~/.gemini/config/
└── mcp_config.json
~/.gemini/antigravity-cli/plugins/<plugin>/
└── mcp_config.json
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

{{< tab name="Devin" >}}
- **Format**: [**Devin**](https://docs.devin.ai/cli/extensibility/mcp/configuration)

```tree
repository/
└── .devin/
    ├── mcp_config.json
    └── mcp_config.local.json
~/.config/devin/
└── mcp_config.json
~/path/to/locally/installed/plugins/<name>/
└── mcp.json
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

{{< tab name="Hermes Agent" >}}
- **Format**: [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/reference/mcp-config-reference)

```tree
~/.hermes/
└── config.yaml
```

```yaml
mcp_servers:
  context7:
    command: npx
    args: ["-y", "@upstash/context7-mcp"]
```
{{< /tab >}}

{{< /tabs >}}
