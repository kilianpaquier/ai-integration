---
description: Ship many plugins into one place, whether they be local or remote.
title: Marketplace
weight: 30
---

Marketplaces are (also) Git repositories with the sole purpose of publishing and giving access to [plugins](/share/plugin).

Shipped plugins can be local references to the same Git repository or
remote references to other plugins (useful to group plugins within one *to rule them all* marketplace, but has some [limitations](#limitations)).

## Structure

A marketplace is identified by its `marketplace.json` (index) referencing one or more plugins.
The place of a marketplace index depends on the target agent runtime(s).

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/plugin-marketplaces)
- **Also read by**: **Codex**, **Copilot** (partial)

```tree
repository/
├── .claude-plugin/
│   └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [**Codex**](https://learn.chatgpt.com/codex/build-plugins)

```tree
repository/
├── .agents/
│   └── plugins/
│       └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-marketplace)

```tree
repository/
├── .github/
│   └── plugin/
│       └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
```
{{< /tab >}}

{{< tab name="Cursor" >}}
- **Format**: [**Cursor**](https://cursor.com/docs/reference/plugins#cursor-multi-plugin-repositories)

```tree
repository/
├── .cursor-plugin/
│   └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
```
{{< /tab >}}

{{< /tabs >}}

## Usage

{{< tabs >}}

{{< tab name="Claude Code" >}}
Marketplaces and plugins installation can go through either the CLI commands or within its execution with `/plugin`.
The latter has the advantage of being able to discover plugins.

```sh
claude
/plugin marketplace add <repository>
/plugin install <plugin-name>@<marketplace-name>
/plugin uninstall <plugin-name>@<marketplace-name>
```

```sh
claude plugin marketplace add <repository>
claude plugin install <plugin-name>@<marketplace-name> [--scope user]
claude plugin install <plugin-name>@<marketplace-name> --scope local
claude plugin install <plugin-name>@<marketplace-name> --scope project
claude plugin uninstall <plugin-name>@<marketplace-name>
```

Plugin installation and tracing (which plugins, which marketplaces) is managed under the following directories:
- `~/.claude/plugins` (user scope, default): available to oneself, across every project.
- `.claude/settings.json` (project scope): available to every collaborator on this repository, once committed.
- `.claude/settings.local.json` (local scope): available to oneself only, in this repository.
{{< /tab >}}

{{< tab name="Codex" >}}
```sh
codex plugin marketplace add <owner>/<repo>
codex plugin add <plugin-name>@<marketplace-name>
codex plugin remove <plugin-name>@<marketplace-name>
```

Plugin installation and tracing (which plugins, which marketplaces) is managed under `~/.codex/plugins`.
{{< /tab >}}

{{< tab name="Copilot" >}}
```sh
copilot plugin marketplace add <owner>/<repo>
copilot plugin install <plugin-name>@<marketplace-name>
copilot plugin uninstall <plugin-name>@<marketplace-name>
```

Plugin installation and tracing (which plugins, which marketplaces) is managed under `~/.copilot/installed-plugins`.
{{< /tab >}}

{{< tab name="Cursor" >}}
No CLI command, installation goes through the Dashboard (**Dashboard > Plugins > Add Marketplace**)
by importing a **GitHub** repository directly.
{{< /tab >}}

{{< tab name="Antigravity" >}}
```sh
agy plugin install <url>
agy plugin install /path/to/local/plugin
agy plugin uninstall <plugin-name>
```
{{< /tab >}}

{{< tab name="Devin" >}}
```sh
devin plugins install <owner>/<repo>
devin plugins install <url>
devin plugins install /path/to/local/plugin
devin plugins remove <plugin-name>
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
```sh
hermes plugins search <term>
hermes plugins install <plugin-name>
hermes plugins install <owner>/<repo> --enable
hermes plugins remove <plugin-name>
```

Plugin installation and tracing (which plugins) is managed under the following directories:
- `~/.hermes/plugins/` (user scope, default): available to oneself, across every project.
- `.hermes/plugins/` (project scope): available to every collaborator on this repository, once committed.
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]Remote plugins
> Remote plugins referenced through `git-subdir` source aren't yet supported by **Copilot**
> ([github/copilot-cli#3376](https://github.com/github/copilot-cli/issues/3376)).
>
> Any marketplace containing a `git-subdir` plugin will be rejected by **Copilot**.
