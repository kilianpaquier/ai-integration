---
description: Automatically enable caveman ultra-compressed without saying "caveman mode" first.
title: Caveman
---

Automatically enable [**caveman**](https://github.com/JuliusBrussee/caveman)'s ultra-compressed
communication mode at the start of every new session, without having to say "caveman mode" first.
<!-- docs-sync:hook:start -->

> [!warning]
> Nodejs is needed in `PATH` environment variable to work.

**Native plugin**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install caveman-autostart@one-for-all
```

**APM package (recommended)**:
```sh
apm install kilianpaquier/ai-integration/plugins/hooks/caveman-autostart -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install caveman-autostart@one-for-all -g
```

<!-- docs-sync:hook:end -->
