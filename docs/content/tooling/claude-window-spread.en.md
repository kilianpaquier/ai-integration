---
description: Refresh Claude windows during the day.
title: Refresh Claude windows
---

**Claude Code** can be subscribed through [basic subscription](https://claude.com/pricing) (Pro, Max x5, Max x20)
or [API based](https://claude.com/pricing#api).

The former costs less (probably), but is constrained through session windows of five hours.
To "counter" this, [**Digital Process Tools**](https://github.com/Digital-Process-Tools/claude-5h-window-spread) provides
a skill to register simple cronjobs on your development machine.

Those cronjobs execute a simple non-interactive **Claude Code** request to keep your currently open window spreading,
which helps spawn new windows during the day.

```sh
npx skills use Digital-Process-Tools/claude-5h-window-spread | claude
```
