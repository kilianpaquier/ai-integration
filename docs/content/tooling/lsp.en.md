---
description: Give agents code intelligence (definitions, references, diagnostics) through language servers.
title: Use LSP servers
---

[**Language Server Protocol**](/components/lsp) servers can be plugged into agents to reduce invalid code
and ease navigation, complementing [codebase indexing](/tooling/code-indexing).

> [!warning]
> Neither [plugins](/share/plugin) or [packages](/share/package) ship servers themselves
> but only the glue for an agent to use them.

## One sharer among others

- **Upstream**: <https://github.com/Piebald-AI/claude-code-lsps>
- **What is it**: A marketplace bundling LSP server plugins for 25+ languages (TypeScript, Rust, Python, Go, Java, Kotlin, etc.).

## Servers installation

{{< tabs >}}

{{< tab name="Bash" >}}
- **Upstream**: <https://github.com/bash-lsp/bash-language-server>

**Server**:
```sh
<npm|pnpm|bun> install -g bash-language-server
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install bash-language-server@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/bash-language-server -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install bash-language-server@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="Golang" >}}
- **Upstream**: <https://github.com/golang/tools/tree/master/gopls>

**Server**:
```sh
go install golang.org/x/tools/gopls@latest
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install gopls@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/gopls -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install gopls@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="Java" >}}
- **Upstream**: <https://github.com/eclipse-jdtls/eclipse.jdt.ls>

**Server** (requires Java 21+):
```sh
brew install jdtls
```

```sh
mise use -g "http:jdtls[url=https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz]@0.0.0"
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install jdtls@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/jdtls -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install jdtls@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="Kotlin" >}}
- **Upstream**: <https://github.com/Kotlin/kotlin-lsp>

**Server** (requires Java 17+):
```sh
brew install kotlin-lsp
```

```sh
mise use -g "github:Kotlin/kotlin-lsp@latest"
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install kotlin-lsp@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/kotlin-lsp -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install kotlin-lsp@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="OpenTofu" >}}
- **Upstream**: <https://github.com/opentofu/tofu-ls>

**Server**:
```sh
brew install tofu-ls
```

```sh
mise use -g "github:opentofu/tofu-ls@latest"
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install tofu-ls@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/tofu-ls -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install tofu-ls@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="Terraform" >}}
- **Upstream**: <https://github.com/hashicorp/terraform-ls>

**Server**:
```sh
brew install terraform-ls
```

```sh
mise use -g terraform-ls@latest
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install terraform-ls@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/terraform-ls -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install terraform-ls@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="TypeScript" >}}
- **Upstream**: <https://github.com/typescript-language-server/typescript-language-server>

**Server**:
```sh
<npm|pnpm|bun> install -g typescript-language-server typescript
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install typescript-language-server@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/typescript-language-server -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install typescript-language-server@claude-code-lsps -g
```
{{< /tab >}}

{{< /tabs >}}
