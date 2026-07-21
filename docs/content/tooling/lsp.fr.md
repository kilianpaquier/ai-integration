---
description: Donnez aux agents de l'intelligence de code (définitions, références, diagnostics) via des serveurs de langage.
title: Utilisez des serveurs LSP
---

Les serveurs [**Language Server Protocol**](/components/lsp) peuvent être branchés aux agents pour réduire le code invalide
et faciliter la navigation, en complément de [l'indexation de bases de code](/tooling/code-indexing).

> [!warning]
> Ni les [plugins](/share/plugin) ni les [packages](/share/package) ne fournissent les serveurs eux-mêmes,
> seulement la colle permettant à un agent de les utiliser.

## Un partageur parmi d'autres

- **Upstream** : <https://github.com/Piebald-AI/claude-code-lsps>
- **Description** : un marketplace regroupant des plugins de serveurs LSP pour plus de 25 langages (TypeScript, Rust, Python, Go, Java, Kotlin, etc.).

## Installation des serveurs

{{< tabs >}}

{{< tab name="Golang" >}}
- **Upstream** : <https://github.com/golang/tools/tree/master/gopls>

**Serveur** :
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

{{< tab name="TypeScript" >}}
- **Upstream** : <https://github.com/yioneko/vtsls>

**Serveur** :
```sh
<npm|pnpm|bun> install -g @vtsls/language-server typescript
```

**Claude plugin**:
```sh
claude plugin marketplace add Piebald-AI/claude-code-lsps
claude plugin install vtsls@claude-code-lsps
```

**APM package (recommended)**:
```sh
apm install Piebald-AI/claude-code-lsps/vtsls -g
```

**APM plugin**:
```sh
apm marketplace add Piebald-AI/claude-code-lsps
apm install vtsls@claude-code-lsps -g
```
{{< /tab >}}

{{< tab name="Java" >}}
- **Upstream** : <https://github.com/eclipse-jdtls/eclipse.jdt.ls>

**Serveur** (nécessite Java 21+) :
```sh
curl -LO http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
mkdir -p ~/.local/jdtls && tar -xzf jdt-language-server-latest.tar.gz -C ~/.local/jdtls
ln -sf ~/.local/jdtls/bin/jdtls ~/.local/bin/jdtls
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

{{< tab name="Bash" >}}
- **Upstream** : <https://github.com/bash-lsp/bash-language-server>

**Serveur** :
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

{{< tab name="Kotlin" >}}
- **Upstream** : <https://github.com/Kotlin/kotlin-lsp>

**Serveur** (nécessite Java 17+) :
```sh
# téléchargez l'archive standalone pour votre plateforme depuis https://github.com/Kotlin/kotlin-lsp/releases
mkdir -p ~/.local/kotlin-lsp && tar -xzf kotlin-server-*.tar.gz -C ~/.local/kotlin-lsp
chmod +x ~/.local/kotlin-lsp/kotlin-lsp.sh
ln -sf ~/.local/kotlin-lsp/kotlin-lsp.sh ~/.local/bin/kotlin-lsp
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

{{< /tabs >}}
