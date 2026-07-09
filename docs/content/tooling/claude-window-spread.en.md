---
description: Refresh Claude windows during the day.
title: Refresh Claude windows
---

Claude Code can be subscribed through [basic subscription](https://claude.com/fr/pricing) (Pro, Max x5, Max x20)
or [token based](https://claude.com/pricing#api).

The former costs less (probably) but is constrainted through session windows of five hours.
To "counter" this, [Digital Process Tools](https://github.com/Digital-Process-Tools/claude-5h-window-spread) provides
a skill to register simple cronjobs on your development machine.

Those cronjobs execute a simple non-interactive Claude request to keep your current opened window spearding,
which help spawn new windows during the day.

```sh
claude plugin marketplace add Digital-Process-Tools/claude-marketplace
claude plugin install claude-5h-window-spread@dpt-plugins
```

```sh
npx skills add Digital-Process-Tools/claude-5h-window-spread
```

```sh
apm marketplace add Digital-Process-Tools/claude-marketplace
apm install claude-5h-window-spread@dpt-plugins
```
