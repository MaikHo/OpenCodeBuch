---
description: Zeigt den persistent gespeicherten Stand einer längeren Arbeit an, ohne Dateien zu verändern.
agent: workflow-syncer
---

# work-status

Zeige ausschließlich den aktuellen persistenten Arbeitsstand.

Lies:

- `.project/activeContext.md`
- `.project/work/current.yaml`
- aktiven Plan
- `.project/work/RESUME.md`
- den unter `last_checkpoint` referenzierten Checkpoint, falls vorhanden
- `git status --short`

Nimm keine Änderungen vor.

## Ausgabe

```md
## Arbeit
## Status / Phase
## Aktive Spec / Plan
## Abgeschlossen
## Aktueller Step
## Nächster möglicher Step (nicht freigegeben)
## Letzter Checkpoint
## Verifikation
## Offene Fragen / Risiken
## Git-Status
```
