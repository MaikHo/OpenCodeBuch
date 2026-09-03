# 7. Context klein halten

Ich möchte mich beim Arbeiten nicht ständig fragen, ob das Context-Fenster jetzt halb, zu zwei Dritteln oder fast voll ist.

Der Workflow soll das Problem vorher lösen.

## Die Grundidee

Nicht alles laden und später versuchen zu komprimieren, sondern von Anfang an nur das laden, was für den aktuellen Step gebraucht wird.

Der normale Einstieg ist deshalb ungefähr:

```text
AGENTS.md
↓
.project/activeContext.md
↓
.project/work/current.yaml
↓
aktive Spec / aktiver Plan, falls vorhanden
↓
benötigter Projektkontext
↓
relevante Dateien
```

Nicht:

```text
Lies bitte das komplette Repository und alle Dokumente.
```

## Sechs Dinge halten den Context klein

1. `AGENTS.md` bleibt kurz.
2. Stabiler Projektkontext liegt in `.project/`.
3. `activeContext.md` enthält nur den aktuellen Überblick.
4. Skills werden nur bei Bedarf geladen.
5. Skripte filtern große Datenmengen vor.
6. Ein Step behandelt nur ein überschaubares Problem.

## `activeContext.md` ist kein Log

Die Datei soll klein bleiben.

Zum Beispiel:

```markdown
# Active Context

## Aktueller Fokus
Importverarbeitung anpassen.

## Aktive Spezifikation
.project/specs/active/0012-import.md

## Aktueller Plan
.project/plans/active/0012-import.plan.md

## Aktueller Step
T-003

## Blocker
Keine.
```

Unter „Zuletzt geändert“ werden alte Punkte ersetzt statt endlos angehängt.

## Was ist mit 64k oder 128k?

Natürlich muss das konfigurierte Modell genügend Context für die Aufgabe haben.

Ich selbst nutze Qwen3.8:27b bevorzugt mit 64k. Aber ich plane den Workflow nicht danach, diese 64k möglichst gut vollzubekommen.

Das Ziel ist genau andersherum: möglichst wenig irrelevanten Context erzeugen.

