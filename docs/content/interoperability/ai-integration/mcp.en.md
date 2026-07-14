---
description: Packages (and plugins) with unit MCP.
title: MCPs
---

[Model Context Protocol](/components/mcp) servers exposing tools or resources to agents.

> [!warning]
> Documentation in progress here.

## External world interactions

{{< tabs >}}

{{< tab name="Context7" >}}
- **Source:** [`plugins/mcp/context7`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/mcp/context7)
- **Upstream:** <https://github.com/upstash/context7>

**Installation**

```sh
claude plugin install context7@one-for-all
```

```sh
copilot plugin install context7@one-for-all
```

```sh
apm install context7@one-for-all
```
{{< /tab >}}

{{< tab name="GitHub" >}}
- **Source:** [`plugins/mcp/github`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/mcp/github)
- **Upstream:** <https://github.com/github/github-mcp-server>

**Installation**

```sh
claude plugin install github@one-for-all
```

```sh
copilot plugin install github@one-for-all
```

```sh
apm install github@one-for-all
```
{{< /tab >}}

{{< tab name="GitLab" >}}
- **Source:** [`plugins/mcp/gitlab`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/mcp/gitlab)
- **Upstream:** <https://gitlab.com/gitlab-org/gitlab>

**Installation**

```sh
claude plugin install gitlab@one-for-all
```

```sh
copilot plugin install gitlab@one-for-all
```

```sh
apm install gitlab@one-for-all
```
{{< /tab >}}

{{< tab name="OpenTofu" >}}
- **Source:** [`plugins/mcp/opentofu`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/mcp/opentofu)
- **Upstream:** <https://github.com/opentofu/opentofu-mcp-server>

**Installation**

```sh
claude plugin install opentofu@one-for-all
```

```sh
copilot plugin install opentofu@one-for-all
```

```sh
apm install opentofu@one-for-all
```
{{< /tab >}}

{{< tab name="Playwright" >}}
- **Source:** [`plugins/mcp/playwright`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/mcp/playwright)
- **Upstream:** <https://github.com/microsoft/playwright-mcp>

**Installation**

```sh
claude plugin install playwright@one-for-all
```

```sh
copilot plugin install playwright@one-for-all
```

```sh
apm install playwright@one-for-all
```
{{< /tab >}}

{{< /tabs >}}

## Agents optimization

{{< tabs >}}

{{< tab name="Cavemem" >}}
> [!tip]
> Choose the right memory model for your agent, see [memory](/tooling/memory).
{{< /tab >}}

{{< tab name="Codebase Memory MCP" >}}
> [!tip]
> Choose the right codebase graph-indexing tool, see [code indexing](/tooling/code-indexing)
{{< /tab >}}

{{< tab name="Codegraph" >}}
> [!tip]
> Choose the right codebase graph-indexing tool, see [code indexing](/tooling/code-indexing)
{{< /tab >}}

{{< /tabs >}}
