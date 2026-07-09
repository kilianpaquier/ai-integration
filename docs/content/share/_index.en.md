---
description: Ways to share AI components (packages, plugins, skills CLI).
title: Share components
weight: 20
---

Sharing AI components (agents, hooks, LSP, MCP, skills, etc.) can be done through multiple ways.

Because while the simple way of just copying / pasting an instruction is fine,
is has limitations regarding updates, security, discovery and naming conflits.
It is also not optimal when many components are shared within a company or even a project.

That's why AI companies (mainly) introduced some concepts to share components that are nowadays available through the majority of agents:

{{< children >}}

## Mental Map

<div style="width: 70%; margin: 0 auto;">

```mermaid
flowchart TD
    Plugin["Plugin"]
    Marketplace["Marketplace"]
    Package["Package"]
    Components["Components<br/>(agents, hooks, LSP, MCP, skills, etc.)"]

    Marketplace -->|bundles| Plugin
    Plugin -->|bundles| Components

    Package -->|bundles| Components
    Package -->|apm pack| Plugin
    Package -->|apm pack| Marketplace

    APM["Agent Package Manager"] -->|apm install| Package
    APM -->|apm marketplace add| Marketplace

    SkillsCLI["Skills CLI"] -->|"npx skills add (only skills)"| Components
```

</div>

<style>
.mermaid svg {
  width: 100% !important;
  max-width: none !important;
}
</style>
