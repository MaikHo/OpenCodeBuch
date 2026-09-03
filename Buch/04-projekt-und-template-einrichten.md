# 4. Projekt und Template einrichten

Das Template ist kein Projektgenerator, der mein Repository übernehmen soll. Es ist eine Sammlung von Workflow-Dateien, die ich bewusst in ein bestehendes oder neues Projekt integriere.

## Die beiden wichtigsten Bereiche

Nach der Übernahme interessieren mich hauptsächlich:

```text
.opencode/
.project/
```

Dazu kommt:

```text
AGENTS.md
```

`.opencode/` beschreibt Bedienung und Rollen.

`.project/` hält den persistenten Projekt- und Arbeitszustand.

`AGENTS.md` enthält die übergeordneten Spielregeln.

## Bestehende Dateien nicht blind überschreiben

Gerade bei einem bestehenden Repository können bereits vorhanden sein:

```text
README.md
.gitignore
AGENTS.md
```

Diese Dateien werden nicht einfach ersetzt. Die relevanten Inhalte werden zusammengeführt.

Das gilt besonders für `AGENTS.md`, weil dort möglicherweise schon projektspezifische Regeln stehen.

## Was aus dem Template übernommen wird

Der vollständige Workflow liegt unter:

```text
Template/.opencode/
Template/.project/
Template/docs/
Template/scripts/
```

Die technische Konfiguration liegt unter:

```text
Template/config/
```

Danach wird eine passende Beispielkonfiguration als `opencode.json` in den Projektroot übernommen und angepasst.

## Warum das Template vollständig übernehmen?

Die Commands referenzieren Agenten und Skills. Einzelne Dateien herauszupicken ist deshalb am Anfang fehleranfälliger als den vollständigen Workflow zu übernehmen.

Später kann ich bewusst Komponenten entfernen, die ich wirklich nicht brauche.

Das ist etwas anderes als von Anfang an eine halbe Struktur zu kopieren und dann herauszufinden, warum ein Command seinen Agenten nicht findet.
