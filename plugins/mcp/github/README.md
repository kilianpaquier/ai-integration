# GitHub MCP

## Installation

Before being able to use the GitHub plugin, you need to create
and export a [GitHub Personal Access Token](https://github.com/settings/tokens) with the required scopes.
Environment variable `GITHUB_PERSONAL_ACCESS_TOKEN` should be set to the value of the token.

```sh
claude plugin install github@bunch-of
```

```sh
copilot plugin install github@bunch-of
```

## MCP Servers

This plugin includes the official GitHub MCP server, which enables repository
management, issue tracking, pull request workflows, and code search.

GitHub MCP server source code lives on their [**GitHub**](https://github.com/github/github-mcp-server).

## Compatibility

This plugin is expected to work with Claude and Copilot.
