---
name: project-context
description: Liest und pflegt dauerhaften Projektkontext gezielt, ohne den Context mit vollständiger Projekthistorie zu überladen.
compatibility: opencode
metadata:
  workflow: software
  purpose: project-context
---

# Projektkontext

Nutze `.project/` als kompakte, dauerhafte Wissens- und Workflow-Schicht.

## Kategorien

- `activeContext.md` – kleines Dashboard der aktuellen Arbeit; abgeleitete Sicht
- `work/current.yaml` – führender Work-State
- `specs/` – Was und Warum größerer Änderungen
- `plans/` – Wie und in welchen Steps
- `context/architecture-fingerprint.yaml` – kompakte Architekturnavigation
- `context/repository.md` – Repository-Überblick
- `projekt.md` – Ziel und Rahmen
- `architecture.md` – ausführliche Architektur
- `entscheidungen.md` – dokumentierte Entscheidungen
- `tech.md` – Technologien und technische Randbedingungen
- `tasks.md` – projektbezogene Aufgaben außerhalb des aktiven Plans
- `bugs.md` – bekannte Fehler/Workarounds
- `CHANGELOG.md` – tatsächlich abgeschlossene und verifizierte Steps

## Vor einer Aufgabe

Lies nur die Kategorien, die für den konkreten Scope nötig sind. Bei aktiver Arbeit beginne mit `activeContext.md` und `work/current.yaml`, nicht mit dem gesamten Projektwissen.

## Nach einer Aufgabe

Schlage eine Aktualisierung nur vor, wenn die Information in späteren Sessions noch wichtig ist. Nutze `architecture-knowledge`, sobald Architekturgründe oder -beobachtungen betroffen sind.

Nicht speichern:

- komplette Chatverläufe,
- temporäre Debug-Ausgaben,
- plausible Vermutungen als Fakten,
- triviale Codeinformationen ohne langfristigen Nutzen,
- erledigte Kleinstschritte ohne bleibende Bedeutung.
