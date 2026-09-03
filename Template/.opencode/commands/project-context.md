---
description: Erstellt oder aktualisiert einen kompakten stabilen Repository-Kontext unter .project/context/repository.md.
agent: net-documentation
---

# project-context

Erzeuge einen kompakten, langlebigen Repository-Kontext.

## Ziel

`.project/context/repository.md` soll einem neuen Modellkontext ermöglichen, das Repository schnell einzuordnen, ohne jedes Mal das gesamte Projekt neu zu inventarisieren.

## Regeln

1. Lies `AGENTS.md`.
2. Lade `context-control`.
3. Nutze `glob`, `grep`, `lsp` und gezielte Datei-Leseoperationen.
4. Dokumentiere nur **stabile technische Fakten**.
5. Keine vollständige Dateiliste.
6. Keine kurzfristigen Task-Notizen.
7. Kritische Fakten aus echten Projektdateien verifizieren.
8. Vor dem Schreiben den neuen Inhalt bzw. Diff-Vorschlag zeigen.
9. Erst nach `Übernehmen` `.project/context/repository.md` ändern.

## Inhalt

```md
# Kompakter Repository-Kontext

## Zweck

## Solutions / Projekte

| Projekt | Typ | Target Framework | Rolle |
|---|---|---|---|

## Architektur und Modulgrenzen

## Einstiegspunkte

## Zentrale Abhängigkeiten

## Daten / Kommunikation

## UI-Technologie

## Verifikation

## Build / Start

## Kritische Besonderheiten

## Offene / unsichere Punkte
```
