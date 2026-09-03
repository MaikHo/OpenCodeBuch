# 12. Skripte und Chunks – das LLM muss nicht alles selbst machen

Ein LLM ist gut darin, Zusammenhänge zu beurteilen und mit unklaren Informationen umzugehen.

Es ist nicht automatisch das beste Werkzeug für jede Schleife, jede Dateisuche und jede Vorverarbeitung.

Deshalb gehören klassische Skripte ausdrücklich zu meinem Workflow.

## Was Skripte übernehmen sollen

Zum Beispiel:

```text
Dateien inventarisieren
Dateien filtern
Logs aufbereiten
Abschnitte extrahieren
große Quellen in Chunks zerlegen
Metadaten sammeln
Zwischenergebnisse validieren
```

Das hat drei Vorteile:

1. deterministisches Verhalten,
2. reproduzierbare Ergebnisse,
3. weniger unnötiger Context.

## Beispiel

Statt einem Modell 500 Dateien zu geben:

```text
Lies alles und finde die relevanten Stellen.
```

kann ein Skript zuerst Kandidaten ermitteln.

Das Modell bekommt anschließend nur:

```text
12 relevante Dateien
+ kurze Metadaten
+ konkrete Aufgabe
```

## Warum mehrere Skriptsprachen?

Das Template berücksichtigt:

```text
Shell
Batch
PowerShell
Python
```

Nicht weil jede Aufgabe vier Implementierungen braucht, sondern weil Projekte auf unterschiedlichen Plattformen laufen.

Für einfache POSIX-Abläufe ist Shell oft ausreichend.

Für Windows-Umgebungen sind PowerShell oder Batch praktisch.

Für komplexere plattformübergreifende Verarbeitung nehme ich gern Python.

## Chunks

Bei großen Dokumenten oder Datenquellen arbeite ich lieber so:

```text
Quelle vorbereiten
→ in sinnvolle Chunks teilen
→ genau einen Chunk bearbeiten
→ Ergebnis persistent speichern
→ nächsten Chunk laden
```

Das hält den Context klein und verhindert, dass bereits erledigte Arbeit bei jeder Session neu erzeugt wird.

Das Template enthält dafür neutrale Beispiele unter `examples/` und Hilfsskripte unter `scripts/`.
