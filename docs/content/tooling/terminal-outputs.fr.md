---
description: Filtrez les sorties du terminal pour ne donner aux agents que ce qui compte vraiment.
title: Filtrez les sorties du terminal
---

Certaines commandes de terminal sont connues pour produire beaucoup de sorties.
Bien que cela soit utile pour les humains, cela pollue le contexte des agents.

Plusieurs outils existent pour contrer cette pollution du contexte.

{{< tabs >}}

{{< tab name="Rust Token Killer" >}}
> [!note]
> Toutes les commandes ne sont pas supportées.

- **Upstream** : <https://github.com/rtk-ai/rtk>
- **Description**: Un CLI enveloppant des appels vers de vraies commandes (les arguments sont transmis tels quels).

```sh
mise use -g github:rtk-ai/rtk
# use '--agent' or '--<agent>' to install the RTK instructions
# and hooks for a specific agent
rtk init -g
```
{{< /tab >}}

{{< /tabs >}}
