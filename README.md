# ai-marketplace <!-- omit in toc -->

<div align="center">
  <img alt="GitLab Release" src="https://img.shields.io/gitlab/v/release/kilianpaquier%2Fai-marketplace?gitlab_url=https%3A%2F%2Fgitlab.com&include_prereleases&sort=semver&style=for-the-badge">
  <img alt="GitLab Issues" src="https://img.shields.io/gitlab/issues/open/kilianpaquier%2Fai-marketplace?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab License" src="https://img.shields.io/gitlab/license/kilianpaquier%2Fai-marketplace?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab CICD" src="https://img.shields.io/gitlab/pipeline-status/kilianpaquier%2Fai-marketplace?gitlab_url=https%3A%2F%2Fgitlab.com&branch=main&style=for-the-badge">
</div>

---

A curated list of plugins, either remotely included to avoid adding many marketplace on our Claude, Copilot, etc. installation
or locally defined to enhance our AI capabilities.

## Installation

```sh
claude plugin marketplace add https://gitlab.com/kilianpaquier/ai-marketplace
claude plugin install <plugin_name>@ki-marketplace
```

## Plugin structure

Each plugin follows a standard structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json      # Plugin metadata (required)
├── .github/plugin
│   └── plugin.json      # Plugin metadata (optional, required if plugin schema changes between Claude and Copilot)
├── .lsp.json            # LSP server configuration (optional)
├── .mcp.json            # MCP server configuration (optional)
├── agents/              # Agent definitions (optional)
├── commands/            # Slash commands (optional, only compatible with Claude)
├── hooks/               # Hooks definitions (optional)
├── skills/              # Skill definitions (optional)
└── README.md            # Documentation
```

## Plugins

| Name                                         | Description                                                                     | Tools  |
| -------------------------------------------- | ------------------------------------------------------------------------------- | ------ |
| [codegraph](plugins/codegraph)               | CodeGraph MCP server for accessing local CodeGraph indexed code knowledge graph | MCP    |
| [opentofu](plugins/opentofu)                 | OpenTofu MCP Server for accessing the OpenTofu Registry                         | MCP    |
| [schema-converter](plugins/schema-converter) | Convert JSON schemas to other formats (Go structs, TypeScript interfaces, etc.) | Skills |
