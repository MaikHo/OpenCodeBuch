---
description: Rekonstruiert den persistenten Stand einer längeren Arbeit und zeigt den nächsten möglichen Step, ohne ihn automatisch auszuführen.
agent: workflow-syncer
---

# work-continue

Rekonstruiere den aktuellen Arbeitsstand.

## Verbindlich

1. Lies `AGENTS.md` erneut.
2. Lade `resume-work` und `context-control`.
3. Lies `.project/activeContext.md`.
4. Lies `.project/work/current.yaml`.
5. Lies den aktiven Plan, den letzten referenzierten Checkpoint und `.project/work/RESUME.md`.
6. Bereits abgeschlossene Steps nicht neu erzeugen.
7. Ermittle den nächsten möglichen Step.
8. Zeige dessen Scope und benötigten Kontext.
9. **STOP und auf aktuelle Benutzerfreigabe warten.**

Ein gespeicherter `next_step` ist nur Zustand, keine Autorisierung.

Wenn kein aktiver Work-State existiert, nichts erfinden; `/work-start` empfehlen.
