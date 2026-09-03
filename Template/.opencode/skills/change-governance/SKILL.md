---
name: change-governance
description: Wendet die konservativen Änderungs-, Freigabe- und Sicherheitsregeln dieses Workflows auf Softwareänderungen an. Nutze den Skill vor Implementierung, Refactoring, Doku-Synchronisation oder Tool-Erstellung.
compatibility: opencode
metadata:
  workflow: software
  purpose: safety
---

# Änderungs-Governance

## Vor jeder Änderung

Kurz benennen:

- betroffene Dateien,
- geplante Änderung,
- technische Begründung,
- erwartete Auswirkungen,
- Risiken/Unsicherheiten.

## Freigabe

Keine implizite Zustimmung annehmen.

Wenn ein Workflow eine ausdrückliche Freigabe verlangt, erst nach dieser Freigabe schreiben.

## Änderungsgrenzen

- Nur Scope-Dateien anfassen.
- Keine Nebenrefactorings.
- Keine stillen Architekturwechsel.
- Keine neue Abhängigkeit ohne Begründung.
- Keine Massenformatierung ohne Nutzen.
- Bestehende Konventionen haben Vorrang.

## Destruktive Aktionen

Ohne ausdrückliche Freigabe niemals:

- Dateien löschen,
- `git reset`,
- `git clean`,
- Force-Push,
- Branches löschen,
- Datenbankdaten löschen,
- Schema/Migration produktionsnah verändern.

## Verifikation

Nach einer Änderung mindestens prüfen:

- Diff,
- relevante Build-/Compilerfehler,
- passende Verifikation,
- Seiteneffekte im betroffenen Scope,
- Dokumentationsbedarf.

Nicht ausgeführte Prüfungen ausdrücklich nennen.
