---
description: Aktiviert einen bereits freigegebenen Plan als persistente längere Arbeit, ohne den ersten Step automatisch zu starten.
agent: workflow-syncer
---

# work-start

Aktiviere eine längere Arbeit auf Basis eines bereits freigegebenen Plans.

## Eingabe

`$ARGUMENTS` kann den Pfad zur aktiven Spec oder zum aktiven Plan enthalten.

## Regeln

1. Lies `AGENTS.md`.
2. Prüfe `.project/work/current.yaml` auf bereits aktive Arbeit.
3. Überschreibe keine aktive Arbeit ohne ausdrückliche Freigabe.
4. Ermittle die aktive Spec unter `.project/specs/active/` und den zugehörigen Plan unter `.project/plans/active/`.
5. Wenn kein freigegebener Plan vorhanden ist, stoppe und empfehle `/create-spec-to-plan`.
6. Zeige den geplanten initialen Work-State zuerst als Vorschlag.
7. **STOP** und warte auf `Übernehmen`.
8. Nach Freigabe synchronisiere:
   - `.project/work/current.yaml`,
   - `.project/activeContext.md`,
   - `.project/work/RESUME.md`.
9. Setze `current_step` noch nicht auf `in_progress`, solange kein Step separat freigegeben wurde.
10. Zeige `T-001` bzw. den ersten offenen Step nur als nächsten möglichen Step.
11. **STOP**.
