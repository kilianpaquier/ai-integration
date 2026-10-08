# ai-integration <!-- omit in toc -->

<div align="center">

<!-- BEGIN_KICKR_BADGES -->
[![GitLab Issues](https://img.shields.io/gitlab/issues/open/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge)](https://gitlab.com/kilianpaquier/ai-integration/-/work_items)
[![GitLab License](https://img.shields.io/gitlab/license/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&style=for-the-badge)](https://gitlab.com/kilianpaquier/ai-integration/-/blob/HEAD/LICENSE)
[![GitLab CICD](https://img.shields.io/gitlab/pipeline-status/kilianpaquier%2Fai-integration?gitlab_url=https%3A%2F%2Fgitlab.com&branch=main&style=for-the-badge)](https://gitlab.com/kilianpaquier/ai-integration/-/pipelines?ref=main)
[![Plumber Score](https://img.shields.io/endpoint?url=https%3A%2F%2Fscore.getplumber.io%2Fgitlab.com%2Fkilianpaquier%2Fai-integration.json&style=for-the-badge)](https://score.getplumber.io/gitlab.com/kilianpaquier/ai-integration)
<!-- END_KICKR_BADGES -->

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
| [cave-talk](plugins/cave-talk)                     | Hooks         | Ultra-compressed communication mode. Cuts output tokens while keeping full technical accuracy.                |
| [code-simplifier](plugins/code-simplifier)         | Skill, Agent  | Simplifies and refines code for clarity, consistency, and maintainability while preserving all functionality. |
| [codebase-memory-mcp](plugins/codebase-memory-mcp) | MCP, Hooks    | High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph.           |
| [codegraph](plugins/codegraph)                     | MCP, Hooks    | Pre-indexed code knowledge graph, auto syncs on code changes, fewer tokens, fewer tool calls, 100% local.     |
| [context7](plugins/context7)                       | MCP, Hooks    | Up-to-date code documentation for LLMs and AI code editors.                                                   |
| [dcg](plugins/dcg)                                 | Hook          | Block destructive shell and git commands before they run                                                      |
| [exam-drill](plugins/exam-drill)                   | Skill         | Endless certification drilling with real exam-format questions built from official documentation.             |
| [feature-dev](plugins/feature-dev)                 | Skill, Agents | Guided feature development with codebase understanding and architecture focus                                 |
| [protected-paths](plugins/protected-paths)         | Hook          | Stop your agent from accessing unwanted or sensitive directories                                              |
| [schema-converter](plugins/schema-converter)       | Skill         | A skill suite to transform JSON schemas into their language equivalents                                       |

## License

The [LICENSE](LICENSE) does not cover:

- The vendored files of the `cave-talk` plugin, which come from [**Caveman**](https://github.com/JuliusBrussee/caveman) under Apache-2.0.
- The vendored files of the `code-simplifier` and `feature-dev` plugins, which come from [**Anthropic**](https://github.com/anthropics/claude-plugins-official) under Apache-2.0.
- The vendored files of the `codebase-memory-mcp` plugin, which come from [**codebase-memory-mcp**](https://github.com/DeusData/codebase-memory-mcp) under MIT.
- The vendored files of the `context7` plugin, which come from [**Context7**](https://github.com/upstash/context7) under MIT.

Each vendored file sits next to its upstream `LICENSE` and lists its `upstream` source and any `modified` notice in its frontmatter.
