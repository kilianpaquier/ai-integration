# Gopls LSP

## Installation

Before being able to use this plugin, you must install [**jdtls**](https://github.com/eclipse-jdtls/eclipse.jdt.ls) on your local system
since the LSP server runs locally.

```sh
mkdir -p "$HOME/.local/share/jdtls"
curl -fsSL http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz | tar xz -C "$HOME/.local/share/jdtls"
ln -sf "$HOME/.local/share/jdtls/bin/jdtls" "$HOME/.local/bin/jdtls"
```

```sh
claude plugin install jdtls@bunch-of
```

## LSP Servers

As the plugin title, this plugin includes the jdtls LSP server with the local bin version.
It is pretty much only a wrapper to share the LSP configuration.

## Compatibility

This plugin is expected to work with Claude and Copilot.
