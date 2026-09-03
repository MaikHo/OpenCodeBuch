---
description: Schließt eine längere Arbeit nach Freigabe ab, archiviert Plan/Spec und synchronisiert den persistenten .project-Zustand.
agent: workflow-syncer
---

# work-finish

Prüfe, ob die aktuelle längere Arbeit abgeschlossen werden kann.

## Prüfung

1. `current.yaml`, aktiven Plan, aktive Spec und letzten Checkpoint lesen.
2. Prüfen, ob alle vorgesehenen Steps abgeschlossen und ihre realen `Verified`-Angaben dokumentiert sind.
3. Offene Fragen/Risiken prüfen.
4. Git-Diff nur als technische Wahrheit über Dateiänderungen heranziehen.
5. Abschlussvorschlag zeigen.
6. **STOP** und auf `Abschließen` warten.

## Nach `Abschließen`

1. Abschluss-Checkpoint bzw. History-Eintrag schreiben.
2. aktiven Plan nach `.project/plans/archive/` verschieben bzw. dort als Archivkopie anlegen; keine Quelldatei entfernen ohne erforderliche Freigabe.
3. aktive Spec nach `.project/specs/done/` überführen.
4. `.project/activeContext.md` auf idle/keine aktive Arbeit setzen.
5. `.project/work/RESUME.md` leeren bzw. auf "keine aktive Arbeit" setzen.
6. `.project/work/current.yaml` auf `completed` und anschließend kontrolliert auf `idle` setzen.
7. Kein Commit, kein Push.
8. **STOP**.
