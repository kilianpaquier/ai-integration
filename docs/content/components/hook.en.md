---
title: Hook
---

Hooks are deterministic configurations to execute a command, a prompt, a webhook call, etc.
when an event is fired during the session runtime.

Events are triggered at various points: a session start (`SessionStart`),
a user submitting an instruction (`UserPromptSubmit`),
before a tool execution (`PreToolUse`), and many other cases (diversity depends on the agent runtime being used).

Typical hook use cases include limiting access to files, guarding commands to avoid destructive actions,
telemetry, code linting, or even automatically saving and restoring session memories.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/hooks#configuration)
- **Also read by**: **Copilot** (only repository level)
- **Deep dive**:
  [events](https://code.claude.com/docs/en/hooks#hook-events),
  [matchers](https://code.claude.com/docs/en/hooks#matcher-patterns),
  [actions](https://code.claude.com/docs/en/hooks#hook-handler-fields)

```tree
repository/
└── .claude/
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
                        "command": ".claude/hooks/lint-check.sh",
                        "shell": "bash"
                    },
                    {
                        "type": "command",
                        "command": ".claude\\hooks\\lint-check.ps1",
                        "shell": "powershell"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Codex" >}}
- **Format**: [**Codex**](https://learn.chatgpt.com/docs/hooks#config-shape)
- **Deep dive**:
  [events](https://learn.chatgpt.com/docs/hooks#sessionstart),
  [matchers](https://learn.chatgpt.com/docs/hooks#matcher-patterns),
  [actions](https://learn.chatgpt.com/docs/hooks#config-shape)

```tree
repository/
└── .codex/
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
                        "command": ".codex/hooks/lint-check.sh",
                        "commandWindows": ".codex\\hooks\\lint-check.ps1"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Copilot" >}}
- **Format**: [**Copilot**](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)
- **Deep dive**:
  [events](https://docs.github.com/en/copilot/reference/hooks-reference#hook-events),
  [matchers](https://docs.github.com/en/copilot/reference/hooks-reference#matcher-filtering),
  [actions](https://docs.github.com/en/copilot/reference/hooks-reference#hook-configuration-format)

```tree
repository/
└── .github/
    ├── copilot/
    │   ├── settings.json
    │   └── settings.local.json
    └── hooks/
        └── lint-check.json
~/.copilot/
├── hooks/
│   └── lint-check.json
└── settings.json
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
                "type": "command",
                "matcher": "bash",
                "bash": ".github/hooks/lint-check.sh",
                "powershell": ".github\\hooks\\lint-check.ps1"
            }
        ]
    }
}
```
{{< /tab >}}

{{< tab name="Mistral Vibe" >}}
- **Format**: [**Mistral Vibe**](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks)
- **Deep dive**:
  [events](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks),
  [matchers](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks),
  [actions](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks)

```tree
repository/
└── .vibe/
    └── hooks.toml
~/.vibe/
└── hooks.toml
```

```toml
[[hooks]]
name = "lint-check"
type = "before_tool"
match = "bash"
command = "node .vibe/hooks/link-check.js"
```

Project hooks load before user hooks.
{{< /tab >}}

{{< tab name="Antigravity" >}}
- **Format**: [**Antigravity**](https://antigravity.google/docs/ide/hooks/)
- **Deep dive**:
  [events](https://antigravity.google/docs/ide/hooks/#supported-events),
  [matchers](https://antigravity.google/docs/ide/hooks/#matcher)

```tree
repository/
└── .agents/
    └── hooks.json
~/.gemini/config/
└── hooks.json
```

```json
{
    "PreToolUse": [
        {
            "matcher": "run_command",
            "hooks": [
                {
                    "type": "command",
                    "command": "./scripts/lint-check.sh"
                }
            ]
        }
    ]
}
```
{{< /tab >}}

{{< tab name="Devin" >}}
- **Format**: [**Devin**](https://docs.devin.ai/cli/extensibility/hooks/overview)
- **Deep dive**:
  [events](https://docs.devin.ai/cli/extensibility/hooks/overview#hook-events)

```tree
repository/
└── .devin/
    └── hooks.v1.json
~/.config/devin/
└── config.json
~/path/to/locally/installed/plugins/<name>/
└── hooks.json
```

```json
{
    "PreToolUse": [
        {
            "matcher": "exec",
            "hooks": [
                {
                    "type": "command",
                    "command": "./scripts/lint-check.sh",
                    "timeout": 10
                }
            ]
        }
    ]
}
```
{{< /tab >}}

{{< tab name="Hermes Agent" >}}
- **Format**: [**Hermes Agent**](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks)
- **Deep dive**:
  [events](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks#available-events)

```tree
<plugin>/
├── plugin.yaml
└── __init__.py
```

```python
def register(ctx):
    ctx.register_hook("pre_tool_call", my_pre_tool_call)
    ctx.register_hook("post_tool_call", my_post_tool_call)
    ctx.register_hook("on_session_start", my_on_session_start)
    ctx.register_hook("pre_gateway_dispatch", my_pre_gateway_dispatch)
```
{{< /tab >}}

{{< /tabs >}}
