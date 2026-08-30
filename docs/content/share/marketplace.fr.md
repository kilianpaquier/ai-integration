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
L'emplacement de l'index d'un marketplace dépend du (ou des) agent *runtime(s)* cible(s).

{{< tabs >}}

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

{{< tab name="Cursor" >}}
- **Format** : [**Cursor**](https://cursor.com/docs/reference/plugins#cursor-multi-plugin-repositories)

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
claude plugin install <plugin-name>@<marketplace-name> [--scope user]
claude plugin install <plugin-name>@<marketplace-name> --scope local
claude plugin install <plugin-name>@<marketplace-name> --scope project
claude plugin uninstall <plugin-name>@<marketplace-name>
```

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous les emplacements suivants :
- `~/.claude/plugins` (niveau utilisateur, par défaut) : disponible pour vous-même, sur tous les projets.
- `.claude/settings.json` (niveau projet) : disponible pour chaque collaborateur de ce dépôt, une fois commité.
- `.claude/settings.local.json` (niveau local) : disponible pour vous-même uniquement, sur ce dépôt.
{{< /tab >}}

{{< tab name="Codex" >}}
```sh
codex plugin marketplace add <owner>/<repo>
codex plugin add <plugin-name>@<marketplace-name>
codex plugin remove <plugin-name>@<marketplace-name>
```

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.codex/plugins`.
{{< /tab >}}

{{< tab name="Copilot" >}}
```sh
copilot plugin marketplace add <owner>/<repo>
copilot plugin install <plugin-name>@<marketplace-name>
copilot plugin uninstall <plugin-name>@<marketplace-name>
```

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.copilot/installed-plugins`.
{{< /tab >}}

{{< tab name="Cursor" >}}
Aucune commande CLI, l'installation passe par le Dashboard (**Dashboard > Plugins > Add Marketplace**)
en important un dépôt **GitHub** en direct.
{{< /tab >}}

{{< tab name="Antigravity" >}}
```sh
agy plugin install /path/to/local/plugin
agy plugin uninstall <plugin-name>
```
{{< /tab >}}

{{< tab name="Devin" >}}
```sh
devin plugins install <owner>/<repo>
devin plugins install <git-url>
devin plugins install ./path/to/local/plugin
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

L'installation des plugins et leur suivi (quels plugins) sont gérés sous les emplacements suivants :
- `~/.hermes/plugins/` (niveau utilisateur, par défaut) : disponible pour vous-même, sur tous les projets.
- `.hermes/plugins/` (niveau projet) : disponible pour chaque collaborateur de ce dépôt, une fois commité.
{{< /tab >}}

{{< /tabs >}}

## Limitations

> [!warning]Plugins distants
> Les plugins distants référencés via une source `git-subdir` ne sont pas encore supportés par **Copilot**
> ([github/copilot-cli#3376](https://github.com/github/copilot-cli/issues/3376)).
>
> Tout marketplace contenant un plugin `git-subdir` sera rejeté par **Copilot**.
