---
name: small-step-workflow
description: Zerlegt Entwicklungsaufgaben in kleine prüfbare Schritte und stoppt nach jedem Schritt bis zur ausdrücklichen Freigabe
compatibility: opencode
metadata:
  workflow: software
  purpose: small-step
---

# Small-Step-Workflow

## Zweck

Verhindere große, schwer kontrollierbare KI-Änderungen.

## Arbeitsweise

1. Verstehe Ziel und aktuellen Zustand.
2. Zerlege die Aufgabe in kleine Schritte.
3. Schlage maximal drei nächste Schritte vor.
4. Setze nur einen ausdrücklich freigegebenen Schritt um.
5. Prüfe das Ergebnis mit Build, Compiler, Linter, Skript oder Diff.
6. Stoppe danach.
7. Beginne keinen Folgeschritt ohne neue Freigabe.

## Ein Schritt ist klein genug, wenn

- sein Zweck in einem Satz erklärbar ist,
- die Änderung überschaubar bleibt,
- sie isoliert geprüft werden kann,
- ein Fehlschlag leicht zurückzuverfolgen ist.

## Nicht tun

- keine Nebenrefactorings,
- keine "wenn wir schon dabei sind"-Änderungen,
- keine automatische Abarbeitung der ganzen Aufgabenliste,
- keine implizite Freigabe aus früheren Vorschlägen ableiten.
