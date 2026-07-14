---
description: One CLI and many packages to share components.
title: Agent Package Manager
weight: 50
---

The [**Agent Package Manager**](https://github.com/microsoft/apm) (APM) installs
[packages](/share/package),
[plugins](/share/plugin) or
[marketplaces](/share/marketplace).

Unlike plugins installed through marketplaces, installations are done directly within known agents directories.

This broaden the agents compatibility because it's the tool who ship (APM) that has to know where to put components
and not agents companies to adjust their agents for standards compatibility (even though it would be great).

## Usage

The APM CLI must be installed to be able to install packages, once installed it works pretty much the same way as marketplaces.

Installation can be made within repositories (to have dependencies or plugins scoped to a repository)
or globally. Scope management is done through the `--global` / `-g` flag.

To install components for only specific agents,
use the [`target(s)`](https://microsoft.github.io/apm/reference/targets-matrix/) property.

{{< tabs >}}

{{< tab name="Dependencies" >}}
*More information about dependencies management on the [APM](https://microsoft.github.io/apm/consumer/manage-dependencies/) website.*

```sh
mise use -g github:microsoft/apm
apm install <package>
```

```yaml
name: my-project
version: 1.0.0
description: Dependencies for project

dependencies:
  apm: []
  mcp: []
  lsp: []

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```

{{< /tab >}}

{{< tab name="Marketplaces" >}}
```sh
mise use -g github:microsoft/apm
apm marketplace add <owner>/<repo>
apm install <package-name>@<marketplace-name>
```
{{< /tab >}}

{{< /tabs >}}

## Lockfile

Every install is tracked in a lockfile so teams can use the exact same dependencies and plugins (similar to `package-lock.json`).

Global scope (`-g` flag):

```tree
~/.apm/
  └── apm.lock.yaml
```

Repository scope (default), meant to be committed:

```tree
repository/
└── apm.lock.yaml
```

## Limitations

### Namespacing

When installed with APM (`apm install`), commands, skills and all slash-like components `/skill-name` lose what plugins brought to the table,
where calls to skills are namespaced (e.g. `/plugin-name:skill-name`).

Slash-like components are as such subjects to name conflicts.
