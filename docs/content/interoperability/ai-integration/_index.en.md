---
title: AI Integration
---

AI Integration provides a number of [plugins](/share/plugin) (following the [**Agent Plugins**](https://agent-plugins.org/specification) Spec)
and [packages](/share/package) to ensure real useful components can be accessed by a high number of agent runtimes
without fighting potentially incompatible official plugins or manual installation.

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

## Explore

{{< children >}}
