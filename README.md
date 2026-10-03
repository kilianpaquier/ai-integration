# ai-integration <!-- omit in toc -->

<div align="center">
  <a href="https://gitlab.com/kilianpaquier/ai-integration/-/releases">
    <img alt="GitLab Release" src="https://img.shields.io/gitlab/v/release/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&include_prereleases&sort=semver&style=for-the-badge">
  </a>
  <a href="https://gitlab.com/kilianpaquier/ai-integration/-/work_items">
    <img alt="GitLab Issues" src="https://img.shields.io/gitlab/issues/open/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  </a>
  <a href="https://gitlab.com/kilianpaquier/ai-integration/-/blob/HEAD/LICENSE">
    <img alt="GitLab License" src="https://img.shields.io/gitlab/license/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge">
  </a>
  <a href="https://gitlab.com/kilianpaquier/ai-integration/-/pipelines?ref=main">
    <img alt="GitLab CICD" src="https://img.shields.io/gitlab/pipeline-status/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&branch=main&style=for-the-badge">
  </a>
  <a href="https://gitlab.com/kilianpaquier/ai-integration/-/blob/HEAD/go.mod">
    <img alt="Go Version" src="https://img.shields.io/gitlab/go-mod/go-version/kilianpaquier/ai-integration?style=for-the-badge">
  </a>
  <a href="https://score.getplumber.io/gitlab.com/kilianpaquier/ai-integration">
    <img alt="Plumber Score" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fscore.getplumber.io%2Fgitlab.com%2Fkilianpaquier%2Fai-integration.json&style=for-the-badge">
  </a>
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

| Name                                               | Kind          | Description                                                                                                   |
| -------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------- |
| [caveman](plugins/caveman)                         | Hooks         | Ultra-compressed communication mode. Cuts output tokens while keeping full technical accuracy.                |
| [code-simplifier](plugins/code-simplifier)         | Skill, Agent  | Simplifies and refines code for clarity, consistency, and maintainability while preserving all functionality. |
| [codebase-memory-mcp](plugins/codebase-memory-mcp) | MCP, Hooks    | High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.           |
| [codegraph](plugins/codegraph)                     | MCP, Hooks    | Pre-indexed code knowledge graph, auto syncs on code changes, fewer tokens, fewer tool calls, 100% local.     |
| [context7](plugins/context7)                       | MCP, Hooks    | Up-to-date code documentation for LLMs and AI code editors.                                                   |
| [dcg](plugins/dcg)                                 | Hook          | Block destructive shell and git commands before they run                                                      |
| [exam-drill](plugins/exam-drill)                   | Skill         | Endless certification drilling with real exam-format questions built from official documentation.             |
| [feature-dev](plugins/feature-dev)                 | Skill, Agents | Guided feature development with codebase understanding and architecture focus                                 |
| [protected-paths](plugins/protected-paths)         | Hook          | Stop your agent from accessing unwanted or sensitive directories                                              |
| [schema-converter](plugins/schema-converter)       | Skill         | A skill suite to transform JSON schemas into their language equivalents                                       |
