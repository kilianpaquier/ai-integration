---
description: Endless certification drilling with real exam-format questions built from official documentation.
title: Exam Drill
---

- **Upstream**:
  [https://gitlab.com/kilianpaquier/ai-integration](https://gitlab.com/kilianpaquier/ai-integration/-/tree/main/plugins/exam-drill)
- **Description**: Endless certification drilling with real exam-format questions built from official documentation.

<!-- docs:start -->

## Skills

| Skill        | Description                                                                           |
| ------------ | ------------------------------------------------------------------------------------- |
| `exam-drill` | Drills one certification, one question per turn, from documentation read that session |

The skill will use the current session's model and effort.
An underdimensioned model or effort will need confirmation before starting the drill because it could produce less accurate
or realistic questions.

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install exam-drill@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/exam-drill -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install exam-drill@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration -g
```

<!-- docs:end -->
