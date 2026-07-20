---
title: Monitor
---

Long-running or external processes (e.g. a deployment rolling out, a log file growing, an healthcheck endpoint)
stay invisible to an agent until the user explicitly asks about them.

That's when monitors enter the dance: a shell command the agent starts automatically,
with every stdout line it produces delivered back as a notification during the session.

> [!warning]
> Monitors are only definable within [plugins](/share/plugin) for now.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [**Claude Code**](https://code.claude.com/docs/en/plugins-reference#monitors)

```tree
~/.claude/plugins/cache/<marketplace>/<plugin>/
└── monitors/
    └── monitors.json
```

```json
[
    {
        "name": "deploy-status",
        "command": "\"${CLAUDE_PLUGIN_ROOT}\"/scripts/poll-deploy.sh ${user_config.api_endpoint}",
        "description": "Deployment status changes"
    },
    {
        "name": "error-log",
        "command": "tail -F ./logs/error.log",
        "description": "Application error log",
        "when": "on-skill-invoke:debug"
    }
]
```
{{< /tab >}}

{{< /tabs >}}
