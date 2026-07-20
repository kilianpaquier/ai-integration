---
title: Language Server Protocol
---

**Language Server Protocol (LSP)** [has been there](https://microsoft.github.io/language-server-protocol)
way before AI arrived.
This is exactly what's being executed to get IntelliSense when developing within IntelliJ, Zed, VSCode, or other code editor.

When an agent edits code, it only sees a file and predicts how it should be written based on its understanding of the format (e.g. a `.java`, etc.),
the project files (because the agent has read them), and the user's request.

To counter potential invalid code and ease code navigation, LSPs can be connected to agents,
and like [MCP](/components/mcp), they offer access to tools such as verifying that code compiles or finding what calls a function.

Combined with [codebase indexing](/tooling/code-indexing), an agent can navigate code far faster
and find what it needs to implement its task(s).

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> This format can only be provided within [plugins](/share/plugin).

- **Format**: [**Open Plugin**](https://open-plugins.com/agent-builders/components/lsp-servers)

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
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/plugins-reference#lsp-servers)

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
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/add-lsp-servers#configuration-fields)

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
