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

This repository follows various standards to structure its components:
- [**Agent Package Manager**](https://microsoft.github.io/apm/producer/author-primitives/)
- [**Agent Skills**](https://agentskills.io/home)
- [**Open Plugin**](https://open-plugins.com/plugin-builders/specification)

## Plugins

### Hooks

| Name                                                 | Description                                                                      |
| ---------------------------------------------------- | -------------------------------------------------------------------------------- |
| [caveman-autostart](plugins/hooks/caveman-autostart) | Auto-enables caveman ultra-compressed communication mode via a SessionStart hook |
| [protected-paths](plugins/hooks/protected-paths)     | Blocks reads/writes to credential and config directories via a PreToolUse hook   |

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
