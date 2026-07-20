---
description: Faites en sorte que les agents se souviennent de ce qu'ils ont fait lors d'autres sessions et les jours précédents.
title: Conservez les souvenirs passées
---

Lorsqu'on "discute" avec des agents, il y a souvent des informations qui doivent être conservées entre les sessions
(par exemple les décisions prises et leurs raisons, l'état d'une tâche en cours, de petites particularités du projet
pas encore documentées quelque part).

C'est pourquoi divers outils existent pour stocker ce qui se passe, ce qui s'est passé pendant les sessions,
et résumer ces informations lorsque nécessaire.

{{< tabs >}}

{{< tab name="Cavemem" >}}
> [!warning]Version NodeJS
> La version de Nodejs doit être inférieure ou égale à 24 (la [dépendance SQLite](https://github.com/WiseLibs/better-sqlite3) n'est pas encore compatible avec la 26).

<br/>

> [!warning]Installation partielle
> `cavemem install` utilise une clé JSON ancienne et incompatible pour les paramètres du serveur MCP de **Claude Code**.

- **Upstream** : <https://github.com/JuliusBrussee/cavemem>
- **Description** : des *hooks* pour stocker et un serveur MCP pour récupérer les informations de session dans une base SQLite locale.

```sh
<npm|pnpm|bun|yarn> install -g node-gyp cavemem
# use '--ide' to install hooks and MCP server for a specific agent
cavemem install
```
{{< /tab >}}

{{< tab name="Mempalace" >}}
- **Upstream** : <https://github.com/MemPalace/mempalace>
- **Description** : des agents pour segmenter les souvenirs, des *hooks* pour stocker, un serveur MCP ou des *skills* pour récupérer
les informations de session dans une base SQLite locale.

```sh
my-agent plugin marketplace add MemPalace/mempalace
my-agent plugin install mempalace@mempalace
```

```sh
apm marketplace add MemPalace/mempalace
apm install mempalace@mempalace
```
{{< /tab >}}

{{< tab name="Remember" >}}
- **Upstream** : <https://github.com/Digital-Process-Tools/claude-remember>
- **Description** : des *hooks* et un *skill* pour stocker et récupérer les informations de session dans des fichiers markdown.

```sh
my-agent plugin marketplace add Digital-Process-Tools/claude-marketplace
my-agent plugin install remember@dpt-plugins
```

```sh
apm marketplace add Digital-Process-Tools/claude-marketplace
apm install remember@dpt-plugins
```
{{< /tab >}}

{{< /tabs >}}
