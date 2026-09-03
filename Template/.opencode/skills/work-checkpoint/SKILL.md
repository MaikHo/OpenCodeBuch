---
name: work-checkpoint
description: Persistiert den Abschluss genau einer verifizierten Arbeitseinheit unter .project/work, ohne den nächsten Step freizugeben.
compatibility: opencode
metadata:
  workflow: software
  purpose: persistence
---

# Arbeitsstand persistieren

## Grundsatz

Ein Step gilt erst als abgeschlossen, wenn:

1. das Ergebnis tatsächlich vorliegt,
2. die im aktiven Plan definierte `Verify`-Methode ausgeführt oder als manuelle Prüfung übergeben wurde,
3. `Verified` das reale Ergebnis enthält,
4. der aktive Plan aktualisiert wurde,
5. ein Checkpoint gespeichert wurde,
6. `current.yaml`, `activeContext.md` und `RESUME.md` synchronisiert wurden; beim Wechsel auf einen neuen Step steht dessen Verifikation wieder auf `not_run`,
7. `CHANGELOG.md` den abgeschlossenen Step enthält.

## Checkpoint

Pfad:

```text
.project/work/checkpoints/<work-id>-NNN.md
```

Inhalt:

```markdown
# Checkpoint <NNN> – <Titel>

## Step
T-...

## Ergebnis
- ...

## Betroffene Dateien
- ...

## Verifikation
- Methode: ...
- Status: PASSED | FAILED | MANUAL_REQUIRED | MANUAL_VERIFIED | BLOCKED
- Ergebnis: ...
- Evidence: ...

## Entscheidungen / Annahmen
- ...

## Risiken / offene Punkte
- ...

## Nächster möglicher Step
- ... (noch nicht freigegeben)
```

## Keine implizite Freigabe

Ein Checkpoint dokumentiert Zustand. Er autorisiert weder den nächsten Step noch Commit, Push oder andere Folgeaktionen.
