# 19. Verifikation und Step-Abschluss

„Code geschrieben“ ist kein Abschlusskriterium.

Ein Step gilt erst als abgeschlossen, wenn die vorgesehene Verifikation tatsächlich durchgeführt und das Ergebnis dokumentiert wurde.

## `Verify` und `Verified`

Beispiel:

```markdown
Verify:
dotnet build

Verified:
PASSED

Evidence:
Build erfolgreich, 0 Fehler.
```

Oder bei einer manuellen Prüfung:

```markdown
Verify:
manual — erzeugte Konfigurationsdatei fachlich prüfen

Verified:
MANUAL REQUIRED
```

Der Agent darf kein erfolgreiches Ergebnis erfinden.

Wenn ein Befehl nicht ausgeführt wurde, bleibt der Zustand beispielsweise:

```text
NOT RUN
```

## Ein Step wird vollständig synchronisiert

Nach erfolgreichem Abschluss gilt im Workflow diese Reihenfolge:

```text
aktiven Plan aktualisieren
↓
Checkpoint schreiben
↓
current.yaml aktualisieren
↓
activeContext.md aktualisieren
↓
RESUME.md aktualisieren
↓
CHANGELOG.md ergänzen
↓
STOP
```

Dafür ist `/complete-step T-xxx` zuständig.

## ChangeLog

Das ChangeLog enthält nicht jeden Tastendruck und nicht jeden unfertigen Zwischenstand.

Es wird nach einem abgeschlossenen Step ergänzt.

Beispiel:

```markdown
## 2026-09-03

### T-003 — Verarbeitung aufgeteilt

Geändert:
- src/Importer.cs
- src/BatchWriter.cs

Grund:
Die bestehende Verarbeitung überschritt bei großen Eingaben ein technisches Limit.

Verifikation:
dotnet build

Ergebnis:
PASSED
```

Damit beschreibt der Plan, was gerade getan werden soll, und das ChangeLog, was tatsächlich abgeschlossen wurde.
