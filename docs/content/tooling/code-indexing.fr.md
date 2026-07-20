---
description: L'indexation des bases de code via une base graphe rend la navigation plus rapide.
title: Indexez vos bases de code
---

Les bases de code peuvent parfois contenir beaucoup de fichiers, avec des structures, interactions et architectures variées.
Lorsqu'un agent cherche quelque chose au sein d'une base de code, son action première est soit de lire tous les fichiers
dont il a besoin lors de la recherche (à l'aveugle), soit d'exécuter des commandes (e.g. `grep`) pour filtrer les fichiers selon leur contenu.

C'est encore plus visible lors de la recherche de dépendances de code : *qu'est-ce qui appelle cette fonction*,
*qu'est-ce qui utilise cette classe ou cette struct*, etc.

Pour corriger ce comportement, les bases de code peuvent à la place être indexées via des bases de données graphe.
En faisant cela, un agent peut utiliser un serveur MCP, un CLI, ou un *skill* pour récupérer facilement toutes les interactions
concernant une classe, une fonction, une méthode, etc. avec une seule requête.

Et ce ne sont pas uniquement les bases de code orientées langage qui peuvent être indexées :
cela peut aussi être utilisé pour des charts Helm, des modules Terraform, des références markdown, etc.
(dépend toujours de l'ensemble de fonctionnalités de chaque outil).

{{< tabs >}}

{{< tab name="Codebase Memory MCP" >}}
- **Upstream** : <https://github.com/DeusData/codebase-memory-mcp>
- **Indexation** : via le serveur MCP ou le CLI
- **Navigation** : via le serveur MCP ou le CLI

Installation du CLI :

```sh
mise use -g github:DeusData/codebase-memory-mcp
codebase-memory-mcp install
```

```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install codebase-memory-mcp@one-for-all
```

```sh
apm marketplace add kilianpaquier/ai-integration
apm install codebase-memory-mcp@one-for-all
```

```sh
apm install kilianpaquier/ai-integration/plugins/mcp/codebase-memory-mcp
```
{{< /tab >}}

{{< tab name="Codegraph" >}}
- **Upstream** : <https://github.com/colbymchenry/codegraph>
- **Indexation** : via le CLI
- **Navigation** : via le serveur MCP ou le CLI

Installation du CLI :

```sh
mise use -g github:colbymchenry/codegraph
codegraph install
codegraph init --index # in the repository
```

Plugin serveur MCP préconfiguré :

```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install codegraph@one-for-all
```

```sh
apm marketplace add kilianpaquier/ai-integration
apm install codegraph@one-for-all
```

```sh
apm install kilianpaquier/ai-integration/plugins/mcp/codegraph
```
{{< /tab >}}

{{< tab name="Graphify" >}}
- **Upstream** : <https://github.com/Graphify-Labs/graphify>
- **Indexation** : via le *skill* ou le CLI
- **Navigation** : via le serveur MCP, le *skill*, ou le CLI

```sh
uv tool install graphifyy
graphify install
```
{{< /tab >}}

{{< /tabs >}}
