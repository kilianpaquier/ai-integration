# ai-integration <!-- omit in toc -->

<div align="center">
  <img alt="GitLab Release" src="https://img.shields.io/gitlab/v/release/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&include_prereleases&sort=semver&style=for-the-badge">
  <img alt="GitLab Issues" src="https://img.shields.io/gitlab/issues/open/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab License" src="https://img.shields.io/gitlab/license/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  <img alt="GitLab CICD" src="https://img.shields.io/gitlab/pipeline-status/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&branch=main&style=for-the-badge">
</div>

---

A simple and humble repository sharing components with as much standardization as possible
and with the sole purpose to have as many agent runtimes as possible compatible with what's being shared.

This is also the source repository for [AI Integration](https://ai.kilianpaquier.dev),
simple and humble documentation explaining AI components, how to properly share them
and some optimization recommendation.

## Installation

```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install <plugin_name>@one-for-all
```

```sh
apm marketplace add kilianpaquier/ai-integration
apm install <plugin_name>@one-for-all -g
```

```sh
apm install kilianpaquier/ai-integration/plugins/<plugin_path> -g
```

```sh
npx skills add kilianpaquier/ai-integration -g
```

## Plugins

### MCP

| Name                                               | Description                                                                                               |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [codebase-memory-mcp](plugins/codebase-memory-mcp) | High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.       |
| [codegraph](plugins/codegraph)                     | Pre-indexed code knowledge graph, auto syncs on code changes, fewer tokens, fewer tool calls, 100% local. |
| [context7](plugins/context7)                       | Up-to-date code documentation for LLMs and AI code editors.                                               |

### Hooks

| Name                                       | Description                                                      |
| ------------------------------------------ | ---------------------------------------------------------------- |
| [protected-paths](plugins/protected-paths) | Stop your agent from accessing unwanted or sensitive directories |

### Skills

| Name                                         | Description                                                             |
| -------------------------------------------- | ----------------------------------------------------------------------- |
| [schema-converter](plugins/schema-converter) | A skill suite to transform JSON schemas into their language equivalents |
