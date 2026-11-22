# devkit

These skills cover the daily development tasks. They read the code before they write anything, and they check with you wherever a wrong guess would be costly.
You get features built from exploration to review, reviews of verified findings and documentation that stays accurate.

<!-- BEGIN_AII_DOCS -->

## Skills

| Skill         | Invocation                  |
| ------------- | --------------------------- |
| `agents-doc`  | `/agents-doc` or automatic  |
| `code-review` | `/code-review` or automatic |
| `doc`         | `/doc` or automatic         |
| `feature`     | `/feature` or automatic     |
| `retro`       | `/retro` or automatic       |

### `feature`

Tell it which feature you want and it investigates the code, then builds the smallest change that meets the standards the code review checks.
It offers you one review rather than running review loops on its own, and asks for your go before building a large change or when a question needs your answer.
Ask it to bring an area to the standards instead and it applies the cheap fixes and lists the costly ones.

### `code-review`

Point it at your diff, a merge request, a branch or a path and it reviews the change without touching it,
and since Claude Code has its own built-in `/code-review`, you reach this one through `/devkit:code-review`.
On any agent runtime, it writes each finding as a [Conventional Comment](https://conventionalcomments.org/) backed by a failure scenario, from the most critical to the least critical.

### `doc`

Reach for it when you write or edit a README, a CONTRIBUTING file, a docs site page or code doc comments.
Before placing anything new, it collects the writing rules and reviews the existing text,
and it rewrites long bullets and runs of short sentences into connected ones.

### `agents-doc`

Use it on AGENTS.md, CLAUDE.md, other agent rule files and skills.
It keeps only what an agent couldn't learn from the repository anyway, and it checks every path and command the file names.

### `retro`

Give it a date, a date range or `all` and it finds the prompts where you corrected the agent in those sessions, then traces each one to the rule, skill or config behind it.
It plans a rework of the rules behind your corrections, with each file's line delta, rather than new lines.

## Agents

Once you approve a plan, the main session hands the legwork to these agents and comes back to you only for a decision that is yours.
It starts each on a cheaper model than its own when the runtime lets it choose.

| Agent                | Role                                                     | Model tier                               |
| -------------------- | -------------------------------------------------------- | ---------------------------------------- |
| `devkit:researcher`  | Looks up official docs and returns the quoted lines      | Fastest                                  |
| `devkit:implementer` | Builds a plan piece, deciding what the piece leaves open | Mid                                      |
| `devkit:executor`    | Applies a plan piece exactly as written                  | Fastest                                  |
| `devkit:verifier`    | Checks the finished build against the plan, read-only    | Fastest, mid after an implementer piece  |

## Installation

**Native plugin (recommended)**:
```sh
my-agent plugin marketplace add kilianpaquier/ai-integration
my-agent plugin install devkit@one-for-all
```

**APM package**:
```sh
apm install kilianpaquier/ai-integration/plugins/devkit -g
```

**APM plugin**:
```sh
apm marketplace add kilianpaquier/ai-integration
apm install devkit@one-for-all -g
```

**Skills CLI**:
```sh
npx skills add kilianpaquier/ai-integration/plugins/devkit -g
```

The **APM** installs bring the `writing-for-agents` skill along.
With a native plugin or **Skills CLI** install, add it with `apm install mattpocock/skills/skills/productivity/writing-for-agents -g`,
or `agents-doc` runs with its own checks only.
The `doc` skill takes its style rules (phrases, punctuation, layout) from the markdown rule file of [**agent-rules**](https://gitlab.com/kilianpaquier/agent-rules), when installed.

<!-- END_AII_DOCS -->

## Compatibility table

| Agent Runtime   | Manifest                     |
| --------------- | ---------------------------- |
| **APM**         | `apm.yml`                    |
| **Antigravity** | `plugin.json`                |
| **Claude Code** | `.claude-plugin/plugin.json` |
| **Codex**       | `.claude-plugin/plugin.json` |
| **Copilot**     | `plugin.json`                |
| **Cursor**      | `plugin.json`                |
| **Devin**       | `.claude-plugin/plugin.json` |
