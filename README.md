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

This marketplace sole purpose is to have plugins compatible while the broadest range of AI assistants, from Claude to Copilot, and more.
That's why it may redefine plugins already available in the official marketplace, unofficial but well-known, etc. yet not compatible with only one assistant.

## Installation

```sh
claude plugin marketplace add https://gitlab.com/kilianpaquier/ai-marketplace.git
claude plugin install <plugin_name>@bunch-of
```

```sh
copilot plugin marketplace add https://gitlab.com/kilianpaquier/ai-marketplace.git
copilot plugin install <plugin_name>@bunch-of
```

```sh
apm marketplace add gitlab.com/kilianpaquier/ai-marketplace
apm install <plugin_name>@bunch-of
```

```sh
npx skills add https://gitlab.com/kilianpaquier/ai-marketplace -g
```

## Plugin structure

Each plugin follows a standard structure:

```
plugin-name/
├── .plugin/
│   └── plugin.json      # Plugin metadata (Open Plugin Spec, required)
├── .mcp.json            # MCP server configuration (optional)
├── agents/              # Agent definitions (optional)
├── commands/            # Slash commands (optional, only compatible with Claude)
├── hooks/               # Hooks definitions (optional)
├── skills/              # Skill definitions (optional)
└── README.md            # Documentation
```

## Plugins

| Name                                                   | Description                                                                          | Tools  |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------ |
| [caveman-autostart](plugins/caveman-autostart)         | Auto-enables caveman ultra-compressed communication mode via a SessionStart hook     | Hooks  |
| [cavemem](plugins/mcp/cavemem)                         | Cross-agent persistent memory MCP server - compressed SQLite store                   | MCP    |
| [codebase-memory-mcp](plugins/mcp/codebase-memory-mcp) | Fast code intelligence engine for AI coding agents - single static binary MCP server | MCP    |
| [codegraph](plugins/mcp/codegraph)                     | CodeGraph MCP server for accessing local CodeGraph indexed code knowledge graph      | MCP    |
| [context7](plugins/mcp/context7)                       | Upstash Context7 MCP server for up-to-date library documentation lookup              | MCP    |
| [github](plugins/mcp/github)                           | Official GitHub MCP server for repository management, issues, and pull requests      | MCP    |
| [gitlab](plugins/mcp/gitlab)                           | GitLab MCP server for repository management, merge requests, and CI/CD               | MCP    |
| [gopls-lsp](plugins/lsp/gopls-lsp)                     | Go language server for code intelligence and refactoring                             | LSP    |
| [jdtls-lsp](plugins/lsp/jdtls-lsp)                     | Java language server (Eclipse JDT.LS) for code intelligence                          | LSP    |
| [kotlin-lsp](plugins/lsp/kotlin-lsp)                   | Kotlin language server for code intelligence                                         | LSP    |
| [opentofu](plugins/mcp/opentofu)                       | OpenTofu MCP Server for accessing the OpenTofu Registry                              | MCP    |
| [playwright](plugins/mcp/playwright)                   | Microsoft Playwright MCP server for browser automation and end-to-end testing        | MCP    |
| [protected-paths](plugins/protected-paths)             | Blocks reads/writes to credential and config directories via a PreToolUse hook       | Hooks  |
| [schema-converter](plugins/schema-converter)           | Convert JSON schemas to other formats (Go structs, TypeScript interfaces, etc.)      | Skills |
| [typescript-lsp](plugins/lsp/typescript-lsp)           | TypeScript/JavaScript language server for enhanced code intelligence                 | LSP    |

## Recommended

Plugins and tools not included in this marketplace but worth installing separately.

### [**cavekit**](https://github.com/JuliusBrussee/cavekit)

Skills-based spec-driven development tool.

```sh
claude plugin marketplace add JuliusBrussee/cavekit
claude plugin install ck@cavekit-marketplace
```

```sh
copilot plugin marketplace add JuliusBrussee/cavekit
copilot plugin install ck@cavekit-marketplace
```

```sh
npx skills add JuliusBrussee/cavekit -s '*' -g
```

```sh
apm marketplace add JuliusBrussee/cavekit
apm install ck@cavekit-marketplace
```

### [**caveman**](https://github.com/JuliusBrussee/caveman)

Ultra-compressed communication mode for reduced output tokens.

```sh
claude plugin marketplace add JuliusBrussee/caveman
claude plugin install caveman@caveman
```

```sh
npx skills add JuliusBrussee/caveman -s '*' -g
```

```sh
apm marketplace add JuliusBrussee/caveman
apm install caveman@caveman
```

*Note: when using Copilot, either you use installation scripts provided by **caveman** repository
or you can use `caveman-autostart` plugin to automatically register caveman mode on session (new, resume, etc.).*

### [**claude-5h-window-spread**](https://github.com/Digital-Process-Tools/claude-5h-window-spread)

Stop hitting your Claude Pro/Max 5h cap by spreading usage across more windows.

```sh
claude plugin marketplace add Digital-Process-Tools/claude-marketplace
claude plugin install claude-5h-window-spread@dpt-plugins
```

```sh
npx skills add Digital-Process-Tools/claude-5h-window-spread -s '*' -g
```

```sh
apm marketplace add Digital-Process-Tools/claude-marketplace
apm install claude-5h-window-spread@dpt-plugins
```

### [**mempalace**](https://github.com/MemPalace/mempalace)

Give your AI a memory - mine projects and conversations into a searchable palace.

```sh
claude plugin marketplace add MemPalace/mempalace
claude plugin install mempalace@mempalace
```

```sh
copilot plugin marketplace add MemPalace/mempalace
copilot plugin install mempalace@mempalace
```

```sh
npx skills add MemPalace/mempalace -s '*' -g
```

```sh
apm marketplace add MemPalace/mempalace
apm install mempalace@mempalace
```

### [**remember**](https://github.com/Digital-Process-Tools/claude-remember)

Continuous memory for Claude Code with tiered daily logs.

```sh
claude plugin marketplace add Digital-Process-Tools/claude-marketplace
claude plugin install remember@dpt-plugins
```

```sh
copilot plugin marketplace add Digital-Process-Tools/claude-marketplace
copilot plugin install remember@dpt-plugins
```

```sh
apm marketplace add Digital-Process-Tools/claude-marketplace
apm install remember@dpt-plugins
```

### [**rtk**](https://github.com/rtk-ai/rtk)

Token-optimized CLI proxy for reduced dev operation costs.
Installation documented on their **Github**.
Easy step with [**mise**](https://mise.jdx.dev/):

```sh
mise use -g github:rtk-ai/rtk
rtk init -g # --agent or --<agent> may be provided to install for a specific agent
```

## Maintaining

[apm.yml](apm.yml) is the source of truth for the marketplace listing. After editing it, regenerate [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) by running:

```sh
apm pack
```
