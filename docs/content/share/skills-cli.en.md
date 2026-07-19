---
description: One CLI to download all the world skills.
title: Skills CLI
weight: 10
---

The [**Skills CLI**](https://github.com/vercel-labs/skills) provides the ability to download any skill
from Git repositories, provided they conform with the [**Agent Skills**](https://agentskills.io) standard
(more information in [components](/components/skill)).

Skills can be discovered from [various places](https://github.com/vercel-labs/skills#skill-discovery) within Git repositories,
and the CLI is compatible with skills defined within [plugins](/share/plugin) or [marketplaces](/share/marketplace).

## Usage

The Skills CLI only needs `npx` to be used, can install skills at both repository and user scope,
and supports [a lot of agents](https://github.com/vercel-labs/skills#supported-agents).

```sh
mise use -g npx
npx skills add <repository_path>
```

## Lockfile

Every install is tracked in a lockfile so teams can use the exact same skills and versions (similar to `package-lock.json`).

User scope (`-g` flag):

```tree
~/.agents/
  └── .skill-lock.json
```

Repository scope (default), meant to be committed:

```tree
repository/
└── skills-lock.json
```

## Explore

The skills ecosystem can be discovered and explored through [skills.sh](https://www.skills.sh/), but as explained at the beginning,
even non-referenced skills or repositories can be used (e.g. private skills).

## Limitations

- It can obviously only install skills, which limits agent optimization.
- It loses skill namespaces (e.g. `/plugin:skill-name`) and can be subject to skill naming conflicts.
