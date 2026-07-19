---
description: One CLI and many packages to share components.
title: Agent Package Manager
weight: 50
---

The [**Agent Package Manager**](https://github.com/microsoft/apm) (APM) installs [packages](/share/package),
[plugins](/share/plugin) (directly) or through [marketplaces](/share/marketplace).

Unlike plugins installed natively through each agent, the APM CLI takes care of placing the components in the right place for each agent,
so that they can be used without any additional configuration (`.agents`, `.claude`, `.copilot`, `.github`, etc.),
broadening agent compatibility.

## Usage

Installation can be made within repositories (to have dependencies or plugins scoped to a repository)
or user-scoped. Scope management is done through the `--global` / `-g` flag.

To install components for only specific agents,
use the [`target(s)`](https://microsoft.github.io/apm/reference/targets-matrix/) property.

{{< tabs >}}

{{< tab name="Package" >}}
Install any package [from anywhere](https://microsoft.github.io/apm/consumer/manage-dependencies/#reference-formats)
(Git repository, local directory, remote component, etc.).

```sh
mise use -g github:microsoft/apm
apm install <path_to_primitive>
apm install --mcp <path_to_primitive>
```

```yaml
name: my-project
version: 0.1.0
description: Dependencies for project

dependencies:
  apm: []
  mcp: []
  lsp: []

targets: [claude, codex, copilot, gemini, kiro, opencode, windsurf]
```

{{< /tab >}}

{{< tab name="Plugin" >}}
> [!note]
> Plugin installation should be considered only as a retro-compatibility feature
> for existing plugins (or marketplaces) without APM manifest (no `apm.yml` or `.apm`).

Install any plugin from any marketplace (unsupported formats unclear), either user-scoped or repository-scoped.

```sh
mise use -g github:microsoft/apm
apm marketplace add <owner>/<repo>
apm install <package-name>@<marketplace-name>
```
{{< /tab >}}

{{< /tabs >}}

## Lockfile

Every install is tracked in a lockfile so teams can use the exact same dependencies and plugins (similar to `package-lock.json`).

User scope (`-g` flag):

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

> [!warning]Namespacing
> When installed with APM (`apm install`), all slash-like components are accessed through `/skill-name`
> while with plugins they are accessed through `/plugin-name:skill-name`.
>
> Slash-like components are therefore subject to [name conflicts](https://github.com/microsoft/apm/issues/739).
