# 8. Kleine Schritte: Spec → Plan → Step

Nicht jede Aufgabe ist gleich groß.

Darum gibt es zwei Wege.

## Kleine Änderung

Wenn die Änderung klar, lokal und überschaubar ist, reicht der kurze Weg:

```text
Anforderung
→ analysieren
→ genau eine kleine Änderung
→ verifizieren
→ STOP
```

Dafür gibt es beispielsweise:

```text
/implement-change
```

## Größere Änderung

Bei einer größeren Arbeit trenne ich drei Ebenen:

```text
Spec
→ Was und warum?

Plan
→ Wie gehen wir vor?

Step
→ Genau eine konkrete Änderung.
```

Die Spec soll noch keine Wunschimplementierung festschreiben.

Beispiel:

```text
Eine große Eingabedatei muss verarbeitet werden können,
ohne dass die bestehende Verarbeitung an einem technischen Limit scheitert.
```

Erst der Plan entscheidet, welche technische Lösung dafür verwendet wird.

## Persistente Pläne

Ein Plan liegt nicht nur im Chat, sondern unter:

```text
.project/plans/active/
```

Ein Step sieht beispielsweise so aus:

```markdown
### T-003 — Verarbeitung aufteilen

Status: Open

Do:
Die vorhandene Verarbeitung in kontrollierte Teilmengen aufteilen.

Verify:
dotnet build

Verified:
NOT RUN
```

`Verify` beschreibt, **wie** geprüft werden soll.

`Verified` dokumentiert, **was tatsächlich passiert ist**.

Das sind zwei verschiedene Dinge.

## Klein genug

Ein guter Step behandelt genau ein Problem, erzeugt einen verständlichen Diff und lässt sich unabhängig prüfen.

Wenn ein Step lautet:

```text
Architektur aufräumen, Datenzugriff modernisieren,
Logging umbauen und UI verbessern
```

ist es kein Step mehr.

## Keine automatische Kette

Auch wenn der Plan T-001 bis T-010 enthält, wird nicht durchgelaufen.

Ein freigegebener Step endet immer mit STOP.
