---
description: Regroupez de nombreux plugins en un seul endroit, qu'ils soient locaux ou distants.
title: Marketplace
weight: 30
---

Les marketplaces sont (aussi) des dépôts Git ayant pour seul but de publier et de donner accès à des [plugins](/share/plugin).

Les plugins fournis peuvent être des références locales au même dépôt Git ou
des références distantes vers d'autres plugins (utile pour regrouper des plugins au sein d'un seul marketplace
*qui les gouverne tous*).

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
- **Format** : [**Codex**](https://developers.openai.com/plugins/build/plugins)

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

Le fichier `~/.agents/plugins/marketplace.json` est un marketplace personnel.
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
- `~/.claude/settings.json` : niveau utilisateur (par défaut), active le plugin pour vous-même sur tous les projets, avec des copies sous `~/.claude/plugins/`.
- `.claude/settings.json` : niveau projet, l'active pour chaque collaborateur une fois commité, et chacun l'installe toujours.
- `.claude/settings.local.json` : niveau local, l'active pour vous-même uniquement, sur ce dépôt.
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
copilot plugin uninstall <plugin-name>
```

L'installation des plugins et leur suivi (quels plugins, quels marketplaces) sont gérés sous `~/.copilot/installed-plugins`.
{{< /tab >}}

{{< tab name="Cursor" >}}
Aucune commande CLI, l'installation passe par le Dashboard (**Dashboard > Plugins > Add Marketplace**)
en important un dépôt **GitHub** en direct.
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

L'installation des plugins et leur suivi (quels plugins) sont gérés sous les emplacements suivants :
- `~/.hermes/plugins/` : niveau utilisateur (par défaut), disponible pour vous-même, sur tous les projets.
- `.hermes/plugins/` : niveau projet, disponible pour chaque collaborateur de ce dépôt, une fois commité.
{{< /tab >}}

{{< tab name="OpenCode" >}}
```sh
opencode plugin add <package>[@<version>]
opencode plugin add github:<owner>/<repo>
opencode plugin list
opencode plugin remove <package>
```

Le CLI gère les plugins *packages* globaux, tandis qu'un dépôt liste les siens dans le tableau `plugins` de `opencode.json`.
{{< /tab >}}

{{< tab name="Pi" >}}
```sh
pi install npm:<package>[@<version>]
pi install git:github.com/<owner>/<repo>[@<ref>]
pi install /path/to/local/package
pi list
pi remove <source>
```

Les *packages* s'installent dans `~/.pi/agent/settings.json`, ou dans `.pi/settings.json` avec `--local`,
et la [galerie de *packages* **Pi**](https://pi.dev/packages) liste les *packages* npm marqués `pi-package`.
{{< /tab >}}

{{< /tabs >}}
