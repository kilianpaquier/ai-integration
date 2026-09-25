---
description: Filtrez les sorties du terminal pour ne donner aux agents que ce qui compte vraiment.
title: Filtrez les sorties du terminal
---

Certaines commandes de terminal sont connues pour produire beaucoup de sorties.
Bien que cela soit utile pour les humains, cela pollue le contexte des agents.

Plusieurs outils existent pour contrer cette pollution du contexte.

{{< tabs >}}

{{< tab name="JFrog Boost" >}}
- **Upstream** : <https://github.com/jfrog/boost>
- **Description** : Un CLI réécrivant les commandes des agents pour compresser les sorties bruyantes (et les réponses JSON des outils MCP) avant qu'elles n'atteignent le contexte.

```sh
mise use -g 'github:jfrog/boost@latest'
# ou
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

```sh
boost init --accept-terms
```
{{< /tab >}}

{{< tab name="Rust Token Killer" >}}
> [!note]
> Toutes les commandes ne sont pas supportées.

- **Upstream** : <https://github.com/rtk-ai/rtk>
- **Description**: Un CLI enveloppant des appels vers de vraies commandes (les arguments sont transmis tels quels).

```sh
brew install rtk
```

```sh
mise use -g rtk@latest
# use '--agent' or '--<agent>' to install the RTK instructions
# and hooks for a specific agent runtime
rtk init -g
```
{{< /tab >}}

{{< /tabs >}}
