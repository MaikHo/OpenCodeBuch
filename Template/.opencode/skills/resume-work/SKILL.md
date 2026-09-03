---
name: resume-work
description: Rekonstruiert eine unterbrochene Software-Aufgabe nach Context-Reset, Modellwechsel oder neuem OpenCode-Start, ohne daraus eine automatische Freigabe abzuleiten.
compatibility: opencode
metadata:
  workflow: software
  purpose: resume
---

# Arbeit fortsetzen

## Ziel

Der neue Modellkontext rekonstruiert nicht den alten Chat, sondern nur den minimal notwendigen Arbeitszustand aus Repository-Dateien.

## Startreihenfolge

1. `AGENTS.md` lesen.
2. `.project/activeContext.md` lesen.
3. `.project/work/current.yaml` lesen.
4. aktive Spec lesen, soweit sie für den aktuellen Scope nötig ist.
5. aktiven Plan lesen.
6. den unter `last_checkpoint` genannten Checkpoint lesen.
7. `.project/work/RESUME.md` lesen.
8. den unter `next_step` genannten Step **als nächsten möglichen Step anzeigen**.
9. **STOP und aktuelle Benutzerfreigabe abwarten.**
10. Erst nach Freigabe nur dafür relevante Projektdateien laden und den Step bearbeiten.

## Bereits abgeschlossene Arbeit

- `completed_steps` nicht erneut bearbeiten.
- Dateien nicht vorsorglich neu schreiben.
- vergangene Verifikation nur lesen; nicht als Beweis für einen neuen Step verwenden.

## Wenn Zustand und Repository widersprechen

Nicht raten. Führende Quellen aus `.project/README.md` verwenden, Git-Diff bei Dateiänderungen prüfen und bei nicht eindeutig auflösbarem Konflikt anhalten.
