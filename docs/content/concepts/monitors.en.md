---
title: Monitors
---

TBD rework humanly

Agents usually only react when prompted, or right after a tool call finishes. Long-running or external
processes - a deployment rolling out, a log file growing, a polled status endpoint - stay invisible until
someone asks about them.

Monitors close that gap: a plugin declares a background shell command, the agent starts it automatically
once the plugin is active, and every stdout line is delivered back as a notification during the session,
without being asked to start the watch.

{{< tabs >}}

{{< tab name="Claude Code" >}}
- **Format**: [Claude Code](https://code.claude.com/docs/en/plugins-reference#monitors)
- **Compatibility**: Claude Code only (no equivalent in Copilot, Codex or Mistral Vibe yet - additional
  compatibility to be verified). Those agents only expose turn-completion notifications (sound, desktop,
  mobile push), not a declarative component that streams a background command's output back into the
  session.

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

Monitors can also be declared inline as `experimental.monitors` in `plugin.json` (same array, or a relative
path string to load from a non-default location). `when` defaults to `"always"` (start at session start and
on plugin reload); `"on-skill-invoke:<skill-name>"` starts it only the first time that skill is dispatched.

Monitors are plugin-only components, requiring Claude Code v2.1.105+ - there's no repository-level standalone
equivalent to `.mcp.json` or `.lsp.json`. They run only in interactive CLI sessions, unsandboxed at the same
trust level as [hooks](../hook), and keep running until the session ends even if the plugin is disabled
mid-session.
{{< /tab >}}

{{< /tabs >}}
