---
description: Packages (and plugins) with unit LSPs.
title: LSPs
---

[Language Server Protocol](/components/lsp) servers exposing code intelligence (completion, navigation, diagnostics).

> [!warning]
> Documentation in progress here.

{{< tabs >}}

{{< tab name="Golang" >}}

- **Source:** [`plugins/lsp/gopls-lsp`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/lsp/gopls-lsp)
- **Upstream:** <https://go.dev/gopls>

**Installation**

```sh
claude plugin install gopls-lsp@one-for-all
```

```sh
copilot plugin install gopls-lsp@one-for-all
```

```sh
apm install gopls-lsp@one-for-all
```
{{< /tab >}}

{{< tab name="Java" >}}
Java language server (Eclipse JDT.LS) for code intelligence.

- **Category:** LSP
- **Source:** [`plugins/lsp/jdtls-lsp`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/lsp/jdtls-lsp)
- **Upstream:** <https://github.com/eclipse-jdtls/eclipse.jdt.ls>

**Installation**

```sh
claude plugin install jdtls-lsp@one-for-all
```

```sh
copilot plugin install jdtls-lsp@one-for-all
```

```sh
apm install jdtls-lsp@one-for-all
```
{{< /tab >}}

{{< tab name="Kotlin" >}}
Kotlin language server for code intelligence.

- **Category:** LSP
- **Source:** [`plugins/lsp/kotlin-lsp`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/lsp/kotlin-lsp)
- **Upstream:** <https://github.com/Kotlin/kotlin-lsp>

**Installation**

```sh
claude plugin install kotlin-lsp@one-for-all
```

```sh
copilot plugin install kotlin-lsp@one-for-all
```

```sh
apm install kotlin-lsp@one-for-all
```
{{< /tab >}}

{{< tab name="TypeScript" >}}
TypeScript/JavaScript language server for enhanced code intelligence.

- **Category:** LSP
- **Source:** [`plugins/lsp/typescript-lsp`](https://gitlab.com/kilianpaquier/ai-marketplace/-/tree/main/plugins/lsp/typescript-lsp)
- **Upstream:** <https://github.com/typescript-language-server/typescript-language-server>

**Installation**

```sh
claude plugin install typescript-lsp@one-for-all
```

```sh
copilot plugin install typescript-lsp@one-for-all
```

```sh
apm install typescript-lsp@one-for-all
```
{{< /tab >}}

{{< /tabs >}}
