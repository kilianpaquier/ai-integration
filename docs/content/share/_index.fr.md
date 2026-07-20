---
title: Partager des composants
weight: 20
---

Arrêtez de partager des composants par copier-coller,
utilisez de vrais outils pour faciliter la maintenance, les mises à jour et renforcer la sécurité.

## Explorer

{{< children >}}

## Carte mentale

<div class="mermaid-diagram">

```mermaid
flowchart TD
    APM["Agent Package Manager"]
    Components["Components<br/>(agents, hooks, LSP, MCP, skills, etc.)"]
    Marketplace["Marketplace"]
    Package["Package"]
    Plugin["Plugin"]
    SkillsCLI["Skills CLI"]

    Marketplace -->|bundles| Plugin
    Plugin -->|bundles| Components

    Package -->|bundles| Components
    Package -->|apm pack| Plugin
    Package -->|apm pack| Marketplace

    APM -->|apm install| Package
    APM -->|apm marketplace add| Marketplace

    SkillsCLI -->|"npx skills add (only skills)"| Components
```

</div>

<style>
.mermaid-diagram {
  width: 75%;
  margin: 0 auto;
}
</style>
