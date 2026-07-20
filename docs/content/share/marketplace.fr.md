---
description: Regroupez de nombreux plugins en un seul endroit, qu'ils soient locaux ou distants.
title: Marketplace
weight: 30
---

Les marketplaces sont (aussi) des dépôts Git ayant pour seul but de publier et de donner accès à des [plugins](/share/plugin).

Les plugins fournis peuvent être des références locales au même dépôt Git ou
des références distantes vers d'autres plugins (utile pour regrouper des plugins au sein d'un seul marketplace
*qui les gouverne tous*, mais présente quelques [limitations](#limitations)).

## Structure

Un marketplace est identifié par son `marketplace.json` (index) référençant un ou plusieurs plugins.
L'emplacement de l'index d'un marketplace dépend du (ou des) agent(s) cible(s).

{{< tabs >}}

{{< tab name="Open Plugin" >}}
- **Format** : [**Open Plugin**](https://open-plugins.com/plugin-builders/marketplace)
- **Lu par** : **Claude Code**, **Copilot**

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
- **Format** : [**Claude Code**](https://code.claude.com/docs/en/plugin-marketplaces)
- **Aussi lu par** : **Codex**, **Copilot** (partiellement)

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
- **Format** : [**Codex**](https://learn.chatgpt.com/codex/build-plugins)

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
- **Format** : [**Copilot**](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-marketplace)

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

## Utilisation

{{< tabs >}}

{{< tab name="Claude Code" >}}
L'installation des marketplaces et plugins peut se faire soit via les commandes CLI, soit en cours d'exécution avec `/plugin`.
Cette dernière option a l'avantage d'offrir la découverte de plugins.

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

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.claude/plugins`.
{{< /tab >}}

{{< tab name="Codex" >}}
```sh
codex plugin marketplace add <owner>/<repo>
```

L'installation/désinstallation de plugins se fait via le navigateur `/plugins` de l'application ChatGPT une fois le marketplace ajouté.

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.codex/plugins`.
{{< /tab >}}

{{< tab name="Copilot" >}}
```sh
copilot plugin marketplace add <owner>/<repo>
copilot plugin install <plugin-name>@<marketplace-name>
copilot plugin uninstall <plugin-name>
```

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.copilot/installed-plugins`.
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]Plugins distants
> Les plugins distants référencés via une source `git-subdir` ne sont pas encore supportés par **Copilot**
> ([github/copilot-cli#3376](https://github.com/github/copilot-cli/issues/3376)).
>
> Tout marketplace contenant un plugin `git-subdir` sera rejeté par **Copilot**.
