---
description: Réduisez les sorties verbeuses des agents (chat, docs, commits, revue de code) à l'essentiel.
title: Parler hommes des cavernes
---

Les agents ont tendance à écrire beaucoup, du contexte généré par les sous-agents aux requêtes/réponses MCP
en passant par les sorties affichées aux utilisateurs, ce qui augmente la consommation de tokens.

La stack [**caveman**](https://github.com/JuliusBrussee/caveman) contre cela en agissant à différents endroits
au sein des agent *runtimes*.

{{< tabs >}}

{{< tab name="Caveman" >}}
> [!warning]
> L'activation des hooks est limitée à **Claude Code** par défaut,
> mais un [plugin mirroir](/interoperability/ai-integration/caveman) peut être utilisé pour élargir la compatibilité entre agent *runtimes*.

- **Upstream** : <https://github.com/JuliusBrussee/caveman>
- **Description** : une suite de *skills* pour des sorties compressées, principalement pour la sortie du chat, la documentation,
les commits, la revue de code, ainsi que des *hooks* pour activer automatiquement le mode de sortie homme des cavernes.

```sh
claude plugin marketplace add kilianpaquier/ai-integration
claude plugin install caveman@one-for-all
```

```sh
apm marketplace add kilianpaquier/ai-integration
apm install caveman@one-for-all -g
```

```sh
apm install kilianpaquier/ai-integration/plugins/caveman -g
```

```sh
npx skills add kilianpaquier/ai-integration
```
{{< /tab >}}

{{< tab name="Cavekit" >}}
- **Upstream** : <https://github.com/JuliusBrussee/cavekit>
- **Description** : une suite de *skills* pour utiliser le framework [**Spec Driven Development**](/accelerate).

```sh
my-agent plugin marketplace add JuliusBrussee/cavekit
my-agent plugin install ck@cavekit-marketplace
```

```sh
apm marketplace add JuliusBrussee/cavekit
apm install ck@cavekit-marketplace -g
```

```sh
apm install JuliusBrussee/cavekit -g
```

```sh
npx skills add JuliusBrussee/cavekit
```
{{< /tab >}}

{{< tab name="Caveman Code" >}}
> [!note]
> Comme ce n'est pas un composant partageable ou pluggable aux agent *runtimes* grand public,
> cette documentation n'entrera pas dans les détails à son sujet.

- **Upstream** : <https://github.com/JuliusBrussee/caveman-code>
- **Description** : un agent *runtime* complet à utiliser à la place de **Claude Code**, **Copilot**, etc.,
  incluant toute la stack **caveman**, et utilisant les abonnements pour se connecter aux LLMs.
{{< /tab >}}

{{< tab name="Caveman Shrink" >}}
> [!note]
> Comme l'intégration peut être complexe dans des environnements multi-serveurs MCP, cette documentation n'entrera pas dans les détails à son sujet.

- **Upstream** : <https://github.com/JuliusBrussee/caveman/tree/main/src/mcp-servers/caveman-shrink>
- **Description** : un serveur proxy MCP pour réduire les entrées et sorties des agents vers et depuis les serveurs MCP.
{{< /tab >}}

{{< tab name="Cavemem" >}}
> [!note]
> Plus d'informations sur ce serveur dans [memory](/tooling/memory).

- **Upstream** : <https://github.com/JuliusBrussee/cavemem>
- **Description** : un serveur MCP pour stocker les souvenirs de session (compressées selon les contraintes **caveman**)
et les réutiliser dans les sessions suivantes.
{{< /tab >}}

{{< /tabs >}}
