---
description: Rafraîchit les fenêtres Claude tout au long de la journée.
title: Rafraîchir les fenêtres Claude
---

**Claude Code** peut être souscrit via un [abonnement basique](https://claude.com/pricing) (Pro, Max x5, Max x20)
ou [via l'API](https://claude.com/pricing#api).

Le premier coûte moins cher (probablement), mais est contraint par des fenêtres de session de cinq heures.
Pour "contrer" cela, [**Digital Process Tools**](https://github.com/Digital-Process-Tools/claude-5h-window-spread) fournit
un *skill* pour enregistrer des cronjobs simples sur votre machine de développement.

Ces cronjobs exécutent une simple requête non interactive **Claude Code** pour maintenir l'étalement de votre fenêtre
actuellement ouverte, faisant apparaître de nouvelles fenêtres au fil de la journée.

```sh
npx skills use Digital-Process-Tools/claude-5h-window-spread | claude
```
