---
description: Group more components than plugins into one.
title: Package
weight: 40
---

A package is a Git repository capable of sharing at once a bundle of components.

Packages can be shipped through the [Agent Package Manager](/share/agent-package-manager), a simple CLI capable of installing
and keeping track of which packages are installed in repositories or globally on a machine.

Package can also be shipped through [plugins](/share/plugin) or [marketplaces](/share/marketplace),
see below [distribution](#distribution).

## Structure

A [package](https://microsoft.github.io/apm/producer/author-primitives/) is identified by its `apm.yml`,
defining its dependencies and shipped components are placed under the `.apm` directory.

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

## Distribution

One of the advantages of packages against plugins, is that they can be shipped as the latter or marketplaces
(**uncompatible components removed**) with the help of `apm pack` command (of the Agent Package Manager).

```sh
mise use -g github:microsoft/apm
apm pack
```

{{< tabs >}}

{{< tab name="Plugin" >}}
By providing the `target(s)` property within the `apm.yml`, a `plugin.json` file is automatically generated.

```yaml
name: example
version: 0.1.0

author: Author Name
description: Package example
license: <LICENSE>

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```

*This [property](https://microsoft.github.io/apm/reference/targets-matrix/) is also used in consumer mode
to install components in the right directory.*
{{< /tab >}}

{{< tab name="Marketplace" >}}
By providing a `marketplace` definition within the `apm.yml`, a `marketplace.json` file is automatically generated
(**Claude Code** and **Codex** format only).

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
    - name: example-package
      description: Human-readable description consumers see
      source: ./packages/example-package
      version: "^1.0.0"
```
{{< /tab >}}

{{< /tabs >}}
