---
description: Erzeugt und persistiert nach Freigabe einen minimalen Resume-Kontext vor Context-Reset oder Modellwechsel.
agent: workflow-syncer
---

# context-compact

Erzeuge einen kompakten Fortsetzungskontext für die aktuelle Arbeit.

## Regeln

1. Lade `context-control` und `work-checkpoint`.
2. Lies `AGENTS.md`, `.project/activeContext.md`, `.project/work/current.yaml`, den aktiven Plan und den letzten Checkpoint.
3. Lies nur Dateien, die notwendig sind, um den nächsten möglichen Schritt eindeutig zu beschreiben.
4. Keine alten Chat-Inhalte rekonstruieren.
5. Keine komplette Repository-Zusammenfassung erzeugen.
6. Zeige zuerst nur den Vorschlag für `.project/work/RESUME.md`.
7. **STOP** und warte auf `Übernehmen`.
8. Erst nach Freigabe ausschließlich `.project/work/RESUME.md` und – falls nötig – den Zeitstempel in `current.yaml` synchronisieren.

## Inhalt von RESUME.md

- Auftrag in 1–3 Sätzen,
- abgeschlossene Steps,
- aktueller technischer Stand,
- nächster **möglicher, noch freizugebender** Step,
- dafür relevante Dateien,
- relevante Entscheidungen,
- offene Fragen/Risiken,
- letzter realer Verifikationsstand.
