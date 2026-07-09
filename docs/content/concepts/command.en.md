---
title: Command / Prompt
---

Commands (or prompts) are slash-like shortcuts `/name` to run customs instructions.

*With the emergence of [skills](../skill) and its standard [Agents Skills](https://agentskills.io/home), commands / prompts tend to be deprecated
or merged into skills.*

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/skills#frontmatter-reference)
- **Compatibility**: Claude Code

*Commands are now merged into skills.*

```tree
.claude/
└── commands/
    └── name.md
~/.claude/
└── commands/
    └── name.md
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── commands/
    └── name.md
```

```yaml
---
description: Brief description shown in the / menu
argument-hint: <input-path> <output-path>
# other frontmatter properties
---

Prompt body, can reference $ARGUMENTS or positional $1, $2 placeholders.
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [Codex](https://learn.chatgpt.com/docs/custom-prompts#add-metadata-and-arguments)
- **Compatibility**: Codex

*Deprecated in favor of [skills](../skill).*

```tree
~/.codex/
└── prompts/
    └── name.md
```

```yaml
---
description: Brief description shown in the prompt picker
argument-hint: KEY=<value>
---

Prompt body, can reference $1..$9, $ARGUMENTS, or named $KEY placeholders.
```
{{< /tab >}}

{{< tab name="VSCode Chat" >}}
- **Format**: [VSCode Chat](https://code.visualstudio.com/docs/agent-customization/prompt-files#_prompt-file-format)
- **Compatibility**: VSCode Chat

```tree
.github/
└── prompts/
    └── explain-code.prompt.md
~/.config/Code/User/
└── prompts/
    └── explain-code.prompt.md
```

```yaml
---
description: Brief description shown in the prompt picker
name: explain-code
argument-hint: <file-path>
# other frontmatter properties
---

Prompt body, can reference ${input:variableName} or ${input:variableName:placeholder}.
```
{{< /tab >}}

{{< /tabs >}}
