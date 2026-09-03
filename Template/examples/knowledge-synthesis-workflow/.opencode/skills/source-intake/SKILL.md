---
name: source-intake
description: Nimmt genau eine neue Wissensquelle auf, validiert sie und ordnet relevante Bereiche Themen zu, ohne die Zieldokumentation zu verändern.
compatibility: OpenCode project skill
---

# Neue Quelle aufnehmen

## Ziel

Bearbeite genau eine Quelle und erzeuge einen belastbaren, kontextsparenden Arbeitsplan.

## Regeln

1. Quelle validieren.
2. Metadaten und Navigationsdateien lesen.
3. Große Primärquelle nicht reflexartig vollständig laden.
4. Zielstruktur gegen die Quellübersicht abgleichen.
5. Pro betroffenem Thema relevante Bereiche bestimmen.
6. Unklare Zuordnung durch gezielte Suche klären.
7. Klassifikation persistent speichern.
8. `next_step` auf das erste offene Thema setzen.

## Grenze

In dieser Phase keine Zieldokumentation verändern.
