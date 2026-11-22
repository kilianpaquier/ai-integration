---
description: Ship many plugins into one place, whether they be local or remote.
title: Marketplace
weight: 30
---

Marketplaces are (also) Git repositories with the sole purpose of publishing and giving access to [plugins](/share/plugin).

Shipped plugins can be local references to the same Git repository or
remote references to other plugins (useful to group plugins within one *to rule them all* marketplace).

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
- **Format**: [**Codex**](https://developers.openai.com/plugins/build/plugins)

```tree
repository/
├── .agents/
│   └── plugins/
│       └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
~/.agents/
└── plugins/
    └── marketplace.json
```

The `~/.agents/plugins/marketplace.json` file is a personal marketplace.
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
- `~/.claude/settings.json`: user scope (default), enables the plugin for oneself across every project, with copies under `~/.claude/plugins/`.
- `.claude/settings.json`: project scope, enables it for every collaborator once committed, and each one still installs it.
- `.claude/settings.local.json`: local scope, enables it for oneself in this repository only.
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
copilot plugin uninstall <plugin-name>
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
agy plugin install <plugin-name>@antigravity-plugins-official
agy plugin install /path/to/local/plugin
agy plugin list
agy plugin uninstall <plugin-name>
```
{{< /tab >}}

{{< tab name="Devin" >}}
```sh
devin plugins install <owner>/<repo>
devin plugins install <url>
devin plugins install --local /path/to/local/plugin
devin plugins list
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
- `~/.hermes/plugins/`: user scope (default), available to oneself, across every project.
- `.hermes/plugins/`: project scope, available to every collaborator on this repository, once committed.
{{< /tab >}}

{{< tab name="OpenCode" >}}
```sh
opencode plugin add <package>[@<version>]
opencode plugin add github:<owner>/<repo>
opencode plugin list
opencode plugin remove <package>
```

The CLI manages global package plugins, while a repository lists its own in the `plugins` array of `opencode.json`.
{{< /tab >}}

{{< tab name="Pi" >}}
```sh
pi install npm:<package>[@<version>]
pi install git:github.com/<owner>/<repo>[@<ref>]
pi install /path/to/local/package
pi list
pi remove <source>
```

Packages install in `~/.pi/agent/settings.json`, or in `.pi/settings.json` with `--local`,
and the [**Pi** package gallery](https://pi.dev/packages) lists npm packages tagged `pi-package`.
{{< /tab >}}

{{< /tabs >}}
