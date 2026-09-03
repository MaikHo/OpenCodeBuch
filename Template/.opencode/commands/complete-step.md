---
description: Schließt genau einen freigegebenen Step nach dokumentierter Verifikation ab und synchronisiert den persistenten .project-Zustand.
agent: workflow-syncer
---

# complete-step

Schließe ausschließlich den in `$ARGUMENTS` genannten Step ab.

## Voraussetzungen

1. Genau dieser Step wurde aktuell explizit freigegeben.
2. Seine Änderung ist umgesetzt.
3. `Verify` wurde tatsächlich ausgeführt oder als manuelle Prüfung an den Benutzer übergeben.
4. `Verified` enthält kein erfundenes Ergebnis.

## Abschlussreihenfolge

Bei erfolgreichem Abschluss:

1. aktiven Plan aktualisieren (`Verified`, Status des Steps),
2. einen Checkpoint unter `.project/work/checkpoints/` schreiben,
3. `.project/work/current.yaml` aktualisieren; beim Wechsel auf einen neuen aktuellen Step dessen `verification` auf `not_run` zurücksetzen,
4. `.project/activeContext.md` kompakt aktualisieren,
5. `.project/work/RESUME.md` auf den nächsten möglichen Step vorbereiten,
6. `.project/CHANGELOG.md` um genau diesen abgeschlossenen Step ergänzen,
7. Ergebnis anzeigen,
8. **STOP**.

Der nächste Step darf nicht begonnen werden. Ein Eintrag in `next_step` ist keine Freigabe.
