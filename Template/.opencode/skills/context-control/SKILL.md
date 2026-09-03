---
name: context-control
description: Hält den Arbeitskontext in langen Software-Aufgaben klein und lädt zuerst nur den persistenten aktuellen Zustand.
compatibility: opencode
metadata:
  workflow: software
  purpose: context-management
---

# Kontext kontrollieren

## Ziel

Der Modellkontext ist ein kurzlebiges Arbeitsfenster. Dauerhafter Zustand liegt im Repository.

## Startreihenfolge

Für eine aktive längere Arbeit zuerst laden:

1. `AGENTS.md`,
2. `.project/activeContext.md`,
3. `.project/work/current.yaml`,
4. aktive Spec aus `current.yaml`, falls für die Aufgabe nötig,
5. aktiven Plan aus `current.yaml`,
6. letzten relevanten Checkpoint,
7. `.project/work/RESUME.md` bei neuer Session/Context-Reset,
8. erst danach die für den aktuellen Step benötigten Projektdateien.

Tieferen Projektkontext nur bei Bedarf laden:

- `.project/context/architecture-fingerprint.yaml` für schnelle Navigation,
- `.project/context/repository.md` für Repository-Überblick,
- `.project/architecture.md`, `.project/entscheidungen.md`, `.project/tech.md`, `.project/projekt.md` nur wenn der aktuelle Scope sie benötigt.

## Nicht reflexartig laden

- das gesamte Repository,
- alle `.project`-Dateien,
- komplette große Logdateien,
- alle Checkpoints,
- alle Specs und Pläne,
- sämtliche Dokumentation.

## Kontrollregel

Wenn eine weitere Datei nur vielleicht nützlich ist, erst über `glob`, `grep`, `lsp` oder gezieltes Lesen prüfen, ob sie wirklich relevant ist.

## Freigaberegel

Ein in `current.yaml`, `activeContext.md` oder `RESUME.md` gespeicherter `next_step` ist nur Zustandsinformation. Er erlaubt keine Schreiboperation und keine Implementierung ohne aktuelle Benutzerfreigabe.
