---
title: Hook
---

Hooks are deterministic configuration to execute a command, a prompt, a webhook call, etc.
when an event is fired during the session runtime.

Events are triggered at various point, a session start (`SessionStart`),
an user submittion an instruction (`UserPromptSubmit`),
before a tool execution (`PreToolUse`), and many other cases (diversity depends on the agent being used).

Typical use-cases for hooks can be access limitation to files,
commands guarding to avoid destructive actions,
telemetry actions, code lint, or even
automatic save or restoration of session(s) memories.

{{< tabs >}}

{{< tab name="Open Plugin" >}}
> [!note]
> This format can only be provided within [plugins](/share/plugin).

- **Format**: [**Open Plugin**](https://open-plugins.com/agent-builders/components/hooks)

```tree
repository/
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
                        "command": "${PLUGIN_ROOT}/hooks/lint-check.sh"
                    }
                ]
            }
        ]
    }
}
```
{{< /tab >}}

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
> [!warning]
> Hooks are experimental in **Mistral Vibe** and require activation through `enable_experimental_hooks = true` in Vibe's config
> or `VIBE_ENABLE_EXPERIMENTAL_HOOKS=true` environment variable.

- **Format**: [**Mistral Vibe**](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks-experimental)
- **Deep dive**:
  [events](https://github.com/mistralai/mistral-vibe/blob/main/README.md#post_agent_turn),
  [matchers](https://github.com/mistralai/mistral-vibe/blob/main/README.md#hooks-experimental),
  [actions](https://github.com/mistralai/mistral-vibe/blob/main/README.md#post_agent_turn)

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

{{< /tabs >}}
