---
name: source-finalization
description: Prüft, ob eine klassifizierte Quelle vollständig verarbeitet wurde, aktualisiert den Status und schlägt die Archivierung vor.
compatibility: OpenCode project skill
---

# Quelle abschließen

## Prüfschritte

1. Klassifikation lesen.
2. Alle zugeordneten Themen auf Bearbeitungsstatus prüfen.
3. Nicht zugeordnete Inhalte prüfen.
4. Offene Konflikte prüfen.
5. Quellen-/Themenindex aktualisieren.
6. Gesamtdokumentation validieren.
7. Abschlussstatus persistieren.

## Status

- `processed`
- `processed_with_conflicts`
- `incomplete`

## Archivierung

Archivierung nur vorschlagen. Nicht ohne ausdrückliche Freigabe ausführen.
