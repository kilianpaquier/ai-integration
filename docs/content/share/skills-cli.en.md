---
description: One CLI to download all the world skills.
title: Skills CLI
weight: 10
---

The [**Skills CLI**](https://github.com/vercel-labs/skills) provides the ability to download any skill
from Git repositories, provided they conform with the [**Agent Skills**](https://agentskills.io) standard
(more information in [components](/components/skill)).

Skills can be discovered from [various places](https://github.com/vercel-labs/skills#skill-discovery) within Git repositories,
and the CLI is compatible with skills defined within [plugins](/share/plugin).

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

- Only skills can be installed through the CLI, limiting agent optimization.
- Skills installed through the CLI aren't namespaced (e.g. `/plugin:skill-name`) and can be subject to naming conflicts.
