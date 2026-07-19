# ai-integration <!-- omit in toc -->

<div align="center">
  <img alt="GitLab Release" src="https://img.shields.io/gitlab/v/release/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&include_prereleases&sort=semver&style=for-the-badge">
  <img alt="GitLab Issues" src="https://img.shields.io/gitlab/issues/open/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab License" src="https://img.shields.io/gitlab/license/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab CICD" src="https://img.shields.io/gitlab/pipeline-status/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&branch=main&style=for-the-badge">
</div>

---

A simple and humble repository sharing components with as much standardization as possible
and with the sole purpose to have as many agents as possible compatible with what's being shared.

This is also the source repository for [AI Integration](https://ai.kilianpaquier.dev),
simple and humble documentation explaining AI components, how to properly share them
and some optimization recommendation.

## Installation

```sh
claude plugin marketplace add kilianpaquier/ai-integration
claude plugin install <plugin_name>@one-for-all
```

```sh
copilot plugin marketplace add kilianpaquier/ai-integration
copilot plugin install <plugin_name>@one-for-all
```

```sh
apm marketplace add gitlab.com/kilianpaquier/ai-integration
apm install <plugin_name>@one-for-all
```

```sh
apm install kilianpaquier/ai-integration/plugins/<plugin_path>
```

```sh
npx skills add kilianpaquier/ai-integration -g
```

## Plugin structure

This repository follows the [**Open Plugin**](https://open-plugins.com/plugin-builders/specification) to structure its plugins.

## Plugins

### Hooks

| Name                                                 | Description                                                                      |
| ---------------------------------------------------- | -------------------------------------------------------------------------------- |
| [caveman-autostart](plugins/hooks/caveman-autostart) | Auto-enables caveman ultra-compressed communication mode via a SessionStart hook |
| [protected-paths](plugins/hooks/protected-paths)     | Blocks reads/writes to credential and config directories via a PreToolUse hook   |

### LSP

| Name                                         | Description                                                          |
| -------------------------------------------- | -------------------------------------------------------------------- |
| [gopls-lsp](plugins/lsp/gopls-lsp)           | Go language server for code intelligence and refactoring             |
| [jdtls-lsp](plugins/lsp/jdtls-lsp)           | Java language server (Eclipse JDT.LS) for code intelligence          |
| [kotlin-lsp](plugins/lsp/kotlin-lsp)         | Kotlin language server for code intelligence                         |
| [typescript-lsp](plugins/lsp/typescript-lsp) | TypeScript/JavaScript language server for enhanced code intelligence |

### MCP

> [!warning]
> Depending on your company restriction regarding MCP servers execution,
> those plugins are not the right one to use since they're not `docker` based.

| Name                                                   | Description                                                                          |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| [cavemem](plugins/mcp/cavemem)                         | Cross-agent persistent memory MCP server - compressed SQLite store                   |
| [codebase-memory-mcp](plugins/mcp/codebase-memory-mcp) | Fast code intelligence engine for AI coding agents - single static binary MCP server |
| [codegraph](plugins/mcp/codegraph)                     | CodeGraph MCP server for accessing local CodeGraph indexed code knowledge graph      |
| [context7](plugins/mcp/context7)                       | Upstash Context7 MCP server for up-to-date library documentation lookup              |
| [github](plugins/mcp/github)                           | Official GitHub MCP server for repository management, issues, and pull requests      |
| [gitlab](plugins/mcp/gitlab)                           | GitLab MCP server for repository management, merge requests, and CI/CD               |
| [opentofu](plugins/mcp/opentofu)                       | OpenTofu MCP Server for accessing the OpenTofu Registry                              |
| [playwright](plugins/mcp/playwright)                   | Microsoft Playwright MCP server for browser automation and end-to-end testing        |

### Skills

| Name                                         | Description                                                                     |
| -------------------------------------------- | ------------------------------------------------------------------------------- |
| [schema-converter](plugins/schema-converter) | Convert JSON schemas to other formats (Go structs, TypeScript interfaces, etc.) |

## Developing

- When updating `README.md` from plugins, the script `./scripts/sh/docs.sh` must be run to update all documentation references.
- The [apm.yml](apm.yml) is the source of truth for the marketplace listing. After editing it, regenerate all `marketplace.json` by running:

  ```sh
  apm pack
  ```
