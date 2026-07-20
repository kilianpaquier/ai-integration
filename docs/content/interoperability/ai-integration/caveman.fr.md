---
description: Active automatiquement le mode ultra-compressé de caveman sans avoir à dire "caveman mode" d'abord.
title: Caveman
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/hooks/protected-paths)
- **Description**: Activation automatique du mode [**caveman**](https://github.com/JuliusBrussee/caveman), pas de *skill* ou prompt requis.

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
