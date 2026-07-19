---
description: Group more components than plugins into one.
title: Package
weight: 40
---

A package is a Git repository capable of sharing at once a bundle of components.

Packages can be installed through the [**Agent Package Manager**](/share/apm), a simple CLI installing, updating,
and keeping track of which packages are installed in repositories or at user scope on a machine.

Packages can also be shipped through [plugins](/share/plugin) or [marketplaces](/share/marketplace), see [distribution](#distribution) below.

## Structure

A [package](https://microsoft.github.io/apm/producer/author-primitives/) is identified by its `apm.yml`,
which defines its dependencies (other packages, MCP servers, LSP servers).
Shipped components are placed under the `.apm` directory.

```tree
repository/
├── apm.yml
└── .apm/
    ├── agents/
    │   └── architect.agent.md
    ├── hooks/
    │   └── pre-tool.json
    ├── instructions/
    │   └── style.instructions.md
    ├── prompts/
    │   └── review.prompt.md
    └── skills/
        └── my-skill/
            └── SKILL.md
```

> [!warning]
> The `.apm` must always be present within a package for `apm install` to work (a `.gitkeep` is sufficient).

## Distribution

As indicated above, packages can be distributed through plugins or marketplaces with the help of the `apm pack` command.
Incompatible components are automatically filtered out during [consumer installation](/share/agent-package-manager#usage) (e.g. instructions).

```sh
mise use -g github:microsoft/apm
apm pack
```

{{< tabs >}}

{{< tab name="Plugin" >}}
> [!warning]Limitation
> Currently, only **Claude Code** and **Copilot** formats are supported for plugin distribution.
> But this doesn't mean other agents can't consume plugins, they just need to [support those formats](/share/plugin).

By providing the `target(s)` property within the `apm.yml`, a `plugin.json` file is automatically generated.

```yaml
name: example
version: 0.1.0

author: Author Name
description: Package example
license: <LICENSE>

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```
{{< /tab >}}

{{< tab name="Marketplace" >}}
> [!warning]Limitation
> Currently, only **Claude Code** and **Codex** formats are supported for marketplace distribution.
> But this doesn't mean other agents can't consume marketplaces, they just need to [support those formats](/share/marketplace).

By providing a `marketplace` definition within the `apm.yml`, a `marketplace.json` file is automatically generated.

```yaml
name: my-project
version: 1.0.0
description: Curated plugins for project

marketplace:
  owner:
    name: owner-name
    url: https://github.com/owner-name
  outputs:
    claude: {}
    codex: {}
  packages:
    - category: <CATEGORY> # needed when generating a codex marketplace.json
      name: example-package
      description: Human-readable description consumers see
      source: ./packages/example-package
```
{{< /tab >}}

{{< /tabs >}}
