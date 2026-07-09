---
title: Language Server Protocol
---

Language Server Protocol (LSP) [have been there](https://microsoft.github.io/language-server-protocol)
for a long time before AI arrived.
This is exactly what's being executed to get IntelliSense when developing within IntelliJ, Zed, VSCode, etc.

When an agent edit code, it only sees a file and predict how it should be written based on its understanding of the format (e.g. a `.java`, etc.),
the project files (because the agent read them) and the user request.

To counter potential invalid code and ease code navigation, LSPs can be connected to agents, like [MCP](../mcp),
it offers them access to tools like ensuring code compile, who call functions, etc.

Combined with [codebases indexing](../tooling/code-indexing), an agent can be by far faster to navigate code
and find what it needs to implement its task(s).

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/plugins-reference#lsp-servers)
- **Compatibility**: Claude Code

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
- **Format**: [Copilot](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/add-lsp-servers#configuration-fields)
- **Compatibility**: Copilot

```tree
.github/
└── lsp.json
~/.copilot/
└── lsp-config.json
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── lsp.json
```

```json
{
    "go": {
        "command": "gopls",
        "fileExtensions": { ".go": "go" },
        "requestTimeoutMs": 90000
    }
}
```
{{< /tab >}}

{{< /tabs >}}
