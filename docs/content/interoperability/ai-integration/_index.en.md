---
title: AI Integration
---

AI Integration provides a number of [plugins](/share/plugin) (following the [**Open Plugin**](https://open-plugins.com/specification) Spec)
and [packages](/share/packages) to ensure components on suggested tools within this documentation can be accessed by a high number of agents
without fighting official potential uncompatible plugins or manual installation.

Before being able to use AI Integration plugins, the marketplace must be installed.

```sh
my-agent plugin marketplace add https://gitlab.com/kilianpaquier/ai-marketplace.git
my-agent plugin install <plugin_name>@one-for-all
```

```sh
apm marketplace add gitlab.com/kilianpaquier/ai-marketplace
apm install <plugin_name>@one-for-all
```

## Explore

{{< children >}}
