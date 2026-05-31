# Kotlin LSP

## Installation

Before being able to use this plugin, you must install [**kotlin-lsp**](https://github.com/Kotlin/kotlin-lsp) on your local system
since the LSP server runs locally. Kotlin LSP requires JDK 25 or later.

```sh
VERSION=<version>
mkdir -p "$HOME/.local/share/kotlin-lsp"
curl -fsSL "https://download-cdn.jetbrains.com/kotlin-lsp/${VERSION}/kotlin-server-${VERSION}.tar.gz" | tar xz -C "$HOME/.local/share/kotlin-lsp" --strip-components=1
ln -sf "$HOME/.local/share/kotlin-lsp/bin/intellij-server" "$HOME/.local/bin/kotlin-lsp"
```

```sh
claude plugin install kotlin-lsp@bunch-of-plugins
```

## LSP Servers

As the plugin title, this plugin includes the kotlin-lsp LSP server with the local bin version.
It is pretty much only a wrapper to share the LSP configuration.

## Compatibility

This plugin is expected to work with Claude and Copilot.
