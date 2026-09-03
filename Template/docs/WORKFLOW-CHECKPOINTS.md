# Fortsetzbare Arbeit mit Checkpoints

## Zweck

Ein Checkpoint dokumentiert den Abschluss **eines real verifizierten Steps**. Er ist kein Chat-Snapshot und keine Freigabe für den nächsten Step.

## Ablauf

```text
freigegebener Step
→ Umsetzung
→ Verify ausführen
→ Verified dokumentieren
→ /complete-step T-xxx
→ Plan aktualisieren
→ Checkpoint
→ current.yaml
→ activeContext.md
→ RESUME.md
→ CHANGELOG.md
→ STOP
```

## Checkpoint-Datei

```text
.project/work/checkpoints/<work-id>-NNN.md
```

Sie enthält mindestens:

- Step-ID und Titel,
- Ergebnis,
- betroffene Dateien,
- Verifikationsmethode,
- realen Status/Result/Evidence,
- Entscheidungen/Annahmen,
- Risiken/offene Punkte,
- nächsten möglichen, **noch nicht freigegebenen** Step.

## Warum zusätzlich zum Plan?

Der Plan ist lebender Arbeitszustand. Der Checkpoint friert den Abschluss einer Einheit nachvollziehbar ein.

## Kein Freigabeersatz

Weder Checkpoint, `current.yaml`, `activeContext.md` noch `RESUME.md` dürfen als Autorisierung interpretiert werden.
