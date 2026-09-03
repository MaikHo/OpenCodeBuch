---
name: architecture-knowledge
description: Trennt beobachtetes, entschiedenes, unbekanntes und widersprüchliches Architekturwissen mit nachvollziehbarer Evidence und Quelle.
compatibility: opencode
metadata:
  workflow: software
  purpose: architecture-knowledge
---

# Architecture Knowledge

Bei bestehenden Projekten unterscheide strikt vier Zustände.

## `observed`

Direkt im Repository belegbar.

Pflicht:
- konkrete `evidence`-Pfade,
- Beschreibung dessen, was sichtbar ist.

Nicht erlaubt:
- einen Grund aus dem beobachteten Muster ableiten.

## `decided`

Dokumentierte Entscheidung.

Pflicht:
- `reason`,
- `source` mit Dokument/Benutzerentscheidung,
- optional zusätzliche Repository-Evidence.

## `unknown`

Der Grund ist nicht dokumentiert.

Pflicht:
- `reason: null` bzw. ausdrücklich unbekannt.

Keine plausible Ersatzbegründung erfinden.

## `conflict`

Mindestens zwei belastbare Quellen widersprechen sich.

Pflicht:
- alle konfliktierenden Quellen aufführen,
- keine Quelle stillschweigend auswählen,
- Entscheidung beim Benutzer belassen.

## Planungsregel

Plane gegen das Repository, wie es existiert. Architekturänderungen benötigen einen eigenen Auftrag und eine ausdrückliche Freigabe.
