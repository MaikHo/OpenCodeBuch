# 16. Git als Kontrollmechanismus

Git gehört für mich direkt zum KI-Workflow.

Nicht weil die KI automatisch committen soll, sondern weil Git sehr gut zeigt, **was wirklich verändert wurde**.

## Vor einem Step

Ich möchte wissen, ob das Arbeitsverzeichnis bereits Änderungen enthält.

Sonst kann ich später nicht sauber unterscheiden:

```text
Was war vorher da?
Was hat dieser Step geändert?
```

## Nach einem Step

Der wichtigste Blick ist der Diff.

Fragen dabei:

- Wurden nur erwartete Dateien verändert?
- Ist der Umfang passend zum Step?
- Gibt es Nebenänderungen?
- Wurde unnötig formatiert oder umgebaut?

Dafür gibt es im Template:

```text
/git-checkpoint
```

## Kleine Steps erzeugen lesbare Diffs

Das ist einer der Gründe, warum ich kleine Schritte bevorzuge.

Ein Diff mit 40 nachvollziehbaren Zeilen kann ich prüfen.

Ein Diff mit 4.000 Zeilen, mehreren Refactorings und einer fachlichen Änderung gleichzeitig ist wesentlich schwieriger zu beurteilen.

## Wer committed?

Der Workflow nimmt mir die Entscheidung nicht ab.

Der Agent kann den Zustand erklären und einen sinnvollen Commit-Zeitpunkt erkennen. Commit und Push bleiben aber eine bewusste Aktion.

Damit ist Git Sicherheitsnetz und Nachweis, nicht Autopilot.
