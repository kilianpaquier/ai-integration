---
description: Ship many plugins into one place, whether they be local or remote.
title: Marketplace
weight: 30
---

Marketplaces are (also) Git repositories, their purpose is to ship [plugins](/share/plugin).

Shipped plugins can be:
- Local to the same Git repository (see [structure](#structure))
- Remote references to other plugins (useful to group plugins within one *to rule them all* marketplace).

## Structure

A marketplace is identified by its `marketplace.json` (index) referencing one or more plugins.
The place of a marketplace index depends on target agent(s) audience.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
- **Format**: [**Open Plugin**](https://open-plugins.com/plugin-builders/marketplace)
- **Read by**: **Claude Code**, **Copilot**

```tree
repository/
├── marketplace.json
├── .plugin/
│   └── marketplace.json
└── plugins/
    └── plugin-name/
        └── ...
```
{{< /tab >}}

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
claude plugin install <plugin-name>@<marketplace-name>
claude plugin uninstall <plugin-name>@<marketplace-name>
```

Plugins installation and traçing (which plugins, which marketplaces) is managed under `~/.claude/plugins`.
{{< /tab >}}

{{< tab name="Codex" >}}
```sh
codex plugin marketplace add <owner>/<repo>
```

Plugin install/uninstall goes through the ChatGPT app's `/plugins` browser once the marketplace is added.

Plugins installation and traçing (which plugins, which marketplaces) is managed under `~/.codex/plugins`.
{{< /tab >}}

{{< tab name="Copilot" >}}
```sh
copilot plugin marketplace add <owner>/<repo>
copilot plugin install <plugin-name>@<marketplace-name>
copilot plugin uninstall <plugin-name>
```

Plugins installation and traçing (which plugins, which marketplaces) is managed under `~/.copilot/installed-plugins`.
{{< /tab >}}

{{< /tabs >}}

## Limitations

### Remote plugins

Remote plugins referenced through `git-subdir` source aren't yet supported by **Copilot**
([github/copilot-cli#3376](https://github.com/github/copilot-cli/issues/3376)),
so such plugins must be cloned and maintained locally as a workaround until then.

Beware that **Copilot** will reject the whole marketplace if it contains a `git-subdir` plugin.
