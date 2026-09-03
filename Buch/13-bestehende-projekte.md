# 13. Bestehende Projekte analysieren

Bei einem bestehenden Projekt ist mein erster Auftrag an die KI nicht:

```text
Wie würdest du das heute neu bauen?
```

Sondern:

```text
Wie funktioniert dieses Projekt tatsächlich?
```

Das ist ein großer Unterschied.

## Erst beobachten

Ich möchte zuerst wissen:

- Wo startet die Anwendung?
- Welche Module gibt es?
- Welche Abhängigkeiten existieren?
- Welche Konventionen sind sichtbar?
- Welche Grenzen sind dokumentiert?
- Welche Teile sind für die aktuelle Aufgabe überhaupt relevant?

Dafür gibt es beispielsweise:

```text
/repo-inventory
/project-context
```

und technologiespezifische Context-Retriever.

## Keine Wunscharchitektur

Ein statischer Helper wird nicht automatisch zu Repository Pattern, Unit of Work, CQRS und einer neuen Projektstruktur umgebaut, nur weil ein Modell diese Architektur hübscher findet.

Für bestehende Software gilt:

> Plan against the repository as it is, not as the agent thinks it should be.

Architekturänderungen sind eigene Entscheidungen und benötigen eine eigene Freigabe.

## Windows-Code unter Linux

Quellcode kann häufig problemlos unter Linux analysiert werden, auch wenn die Anwendung später unter Windows läuft.

Aber Analyse, Buildbarkeit und Ausführbarkeit sind verschiedene Dinge.

Ein Windows-spezifisches Framework, native Abhängigkeiten oder Betriebssystem-APIs können dazu führen, dass der Code unter Linux gelesen und verstanden werden kann, aber nicht vollständig gebaut oder ausgeführt werden kann.

Dann muss das Ergebnis genau das sagen.

Nicht:

```text
Das Projekt ist kaputt.
```

sondern beispielsweise:

```text
Die statische Analyse ist möglich.
Der vollständige Build benötigt jedoch die Windows-Zielumgebung.
```

Das ist eine wichtige Unterscheidung.
