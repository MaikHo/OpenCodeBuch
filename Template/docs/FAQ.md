# FAQ – OpenCode Workflow Template

## Muss ich für jede Änderung eine Spec und einen Plan erstellen?

Nein. Kleine, klar begrenzte Änderungen verwenden den kurzen Workflow. Spec und persistenter Plan sind für größere oder länger laufende Arbeiten gedacht.

## Welcher Command ist der sichere Einstieg?

```text
/help-workflow Was ist für diese Aufgabe der richtige Einstieg?
```

## Ändert das Modell automatisch Dateien?

Nicht allein. Das Modell erzeugt Tool-Aufrufe; OpenCode prüft die konfigurierten Permissions. Schreibzugriffe können `allow`, `ask` oder `deny` sein.

## Kann der Agent Git committen oder pushen?

Der Workflow sieht Commit und Push als Benutzerentscheidung. `/git-checkpoint` prüft Status und Diff, führt aber keinen automatischen Commit oder Push durch.

## Startet der Workflow automatisch den nächsten Step?

Nein. Eine Freigabe gilt nur für genau den genannten Step. Nach Umsetzung, Verifikation und Zustandsaktualisierung gilt `STOP`.

## Was ist der Unterschied zwischen `activeContext.md`, `current.yaml` und `RESUME.md`?

- `activeContext.md`: kleines Dashboard für Mensch und Agent
- `current.yaml`: strukturierter maschinenlesbarer Work-State
- `RESUME.md`: kompakte Übergabe für eine neue Session

Sie haben unterschiedliche Aufgaben und sollen nicht als konkurrierende Kopien derselben Datei gepflegt werden.

## Was passiert, wenn der Grund für eine Architekturentscheidung unbekannt ist?

Er bleibt `Unknown`. Ein plausibler Grund des Modells darf nicht als Projektwissen gespeichert werden. Der Skill `architecture-knowledge` unterscheidet `Observed`, `Decided`, `Unknown` und `Conflict`.

## Was mache ich bei widersprüchlichen Quellen?

Als `Conflict` dokumentieren und keine Seite eigenmächtig zur Wahrheit erklären. Wenn die konkrete Aufgabe davon abhängt, Benutzerentscheidung anfordern.

## Muss ich immer die komplette `architecture.md` laden?

Nein. Für die schnelle Orientierung gibt es `.project/context/architecture-fingerprint.yaml`. Tiefergehende Dokumentation wird nur bei Bedarf geladen.

## Was ist `Verify`?

Die definierte Prüfmethode eines Steps. Das kann ein Build, Linter, Skript, Dateivergleich oder eine manuelle Prüfung sein. Das Template schreibt kein bestimmtes Technologiesystem vor.

## Was ist `Verified`?

Das tatsächlich ausgeführte Ergebnis der Verifikation. Es darf nicht erfunden oder aus dem Code nur vermutet werden.

## Wie arbeite ich nach einem Context-Reset weiter?

Vorher `/context-compact`, anschließend in einer neuen Session `/work-continue`. Details stehen in [CONTEXT-RESET.md](CONTEXT-RESET.md).

## Wo finde ich alle Commands, Agenten, Skills und Zustandsdateien?

In [DATEI-REFERENZ.md](DATEI-REFERENZ.md).

## Wo finde ich die schnelle Bedienungsanleitung?

In [BENUTZERHANDBUCH.md](BENUTZERHANDBUCH.md) und für den kürzesten Einstieg in [QUICKSTART.md](QUICKSTART.md).

## Wie arbeiten Modell, OpenCode und Agenten zusammen?

Siehe [MODELL-UND-AGENT.md](MODELL-UND-AGENT.md). Das Template setzt kein bestimmtes Modell voraus.

## Sind die .NET-Commands Pflicht?

Nein. `/review-dotnet` und `/bug-dataflow` sind mitgelieferte technologiespezifische Beispiele. Der Kernworkflow funktioniert unabhängig davon und die Dateien können für andere Stacks angepasst oder entfernt werden.
