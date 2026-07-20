---
title: AI Integration
---

AI Integration fournit un certain nombre de [plugins](/share/plugin) (suivant la spécification [**Open Plugin**](https://open-plugins.com/specification))
et de [packages](/share/package) pour garantir que des composants réellement utiles soient accessibles à un grand nombre d'agents
sans avoir à lutter contre des plugins officiels potentiellement incompatibles ou une installation manuelle.

```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install <plugin_name>@one-for-all
```

```sh
apm marketplace add gitlab.com/kilianpaquier/ai-integration
apm install <plugin_name>@one-for-all
```

```sh
apm install kilianpaquier/ai-integration/plugins/<plugin_path>
```

```sh
npx skills add kilianpaquier/ai-integration -g
```

## Explorer

{{< children >}}
