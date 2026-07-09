---
title: Hook
---

Hooks are deterministic (that's why is liked about them) configuration to run terminal commands
(and more recently can also run prompts).

Hooks can be fired at different time of a session execution, at its start (`SessionStart`),
when the user submits an instruction (`UserPromptSubmit`), before a tool is executed (`PreToolUse`), etc.

The diversity of events depends on the agents being used and the configuration be made in various places
depending on the use case.

TBD exit codes
TBD the tree bulletpoints rework

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/hooks#configuration)
- **Compatibility**: Copilot (not all events and hooks types) (additional compatibility to be verified)
- **Which events can be configured**: [Hook events](https://code.claude.com/docs/en/hooks#hook-events)
- **Specific tools matching**: [Matcher patterns](https://code.claude.com/docs/en/hooks#matcher-patterns)
- **Possible actions**: [Hook types](https://code.claude.com/docs/en/hooks#hook-handler-fields)

```tree
.claude/
├── settings.json
└── settings.local.json
~/.claude/
└── settings.json
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── hooks/
    └── hooks.json
```

```json
{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Bash",
                "hooks": [
                    {
                        "type": "command",
                        "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/lint-check.sh",
                        "shell": "bash"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [Codex](https://learn.chatgpt.com/docs/hooks#config-shape)
- **Compatibility**: Codex
- **Which events can be configured**: [SessionStart](https://learn.chatgpt.com/docs/hooks#sessionstart)
- **Specific tools matching**: [Matcher patterns](https://learn.chatgpt.com/docs/hooks#matcher-patterns)
- **Possible actions**: [Config shape](https://learn.chatgpt.com/docs/hooks#config-shape)

```tree
.codex/
└── hooks.json
~/.codex/
└── hooks.json
~/.codex/plugins/cache/<marketplace>/<plugin>/<version>/
└── hooks/
    └── hooks.json
```

```json
{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Bash",
                "hooks": [
                    {
                        "type": "command",
                        "command": "/usr/bin/python3 .codex/hooks/lint-check.py",
                        "commandWindows": "py .codex\\hooks\\lint-check.py"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [Copilot](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)
- **Compatibility**: Copilot
- **Which events can be configured**: [Hook events](https://docs.github.com/en/copilot/reference/hooks-reference#hook-events)
- **Specific tools matching**: [Matcher filtering](https://docs.github.com/en/copilot/reference/hooks-reference#matcher-filtering)
- **Possible actions**: [Hook configuration format](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)

```tree
.github/
└── hooks/
    └── lint-check.json
~/.copilot/
└── hooks/
    └── lint-check.json
~/.copilot/installed-plugins/<marketplace>/<plugin>/
└── hooks/
    └── hooks.json
```

```json
{
    "version": 1,
    "hooks": {
        "preToolUse": [
            {
                "bash": "node scripts/lint-check.js",
                "powershell": "node scripts/lint-check.js"
            }
        ],
        "postToolUse": [
            {
                "type": "http",
                "url": "https://localhost:8080/hooks/post-tool-use"
            },
            {
                "type": "prompt",
                "prompt": "Summarize the change"
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Cursor" >}}
- **Format**: [Cursor](https://cursor.com/docs/agent/hooks#configuration-file)
- **Compatibility**: Cursor
- **Which events can be configured**: [Hook events](https://cursor.com/docs/agent/hooks#hook-events)
- **Specific tools matching**: [Matcher configuration](https://cursor.com/docs/agent/hooks#matcher-configuration)
- **Possible actions**: [Hook types](https://cursor.com/docs/agent/hooks#hook-types)

```tree
.cursor/
└── hooks.json
~/.cursor/
└── hooks.json
~/.cursor/plugins/local/<plugin>/
└── hooks.json
```

```json
{
    "version": 1,
    "hooks": {
        "preToolUse": [{ "command": "./hooks/lint-check.sh" }]
    }
}
```

Priority order (highest to lowest): Enterprise → Team → Project → User.
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [Mistral Vibe](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks-experimental)
- **Compatibility**: Mistral Vibe
- **Which events can be configured**: [post_agent_turn](https://github.com/mistralai/mistral-vibe/blob/main/README.md#post_agent_turn)
- **Specific tools matching**: [Hooks (Experimental)](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks-experimental)
- **Possible actions**: [post_agent_turn](https://github.com/mistralai/mistral-vibe/blob/main/README.md#post_agent_turn)

```tree
.vibe/
└── hooks.toml
~/.vibe/
└── hooks.toml
```

```toml
[[hooks]]
name = "deny-rm-rf"
type = "before_tool"
match = "bash"
command = "uv run python /path/to/guard-bash"
```

Project hooks load before user hooks.
{{< /tab >}}

{{< /tabs >}}
