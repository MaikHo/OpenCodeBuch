# 15. Governance und Permissions

Prompt-Regeln allein sind nett, aber sie sind keine technische Grenze.

Darum kombiniere ich drei Ebenen:

```text
AGENTS.md
→ allgemeine Regeln

Agent / Skill
→ Rollen- und Arbeitsregeln

OpenCode Permissions
→ technische Leitplanken
```

## Keine implizite Freigabe

Ein gespeicherter nächster Step ist keine Freigabe.

Ein Plan ist keine Freigabe zur kompletten Umsetzung.

Ein erfolgreich abgeschlossener Step ist keine Freigabe für den nächsten.

## Destruktive Aktionen

Dinge wie Löschen, Reset, Force-Push oder unkontrollierte Repository-Änderungen gehören nicht in einen Standardablauf.

Wenn sie überhaupt notwendig sind, brauche ich dafür eine bewusste Entscheidung.

## Read-only Rollen

Reviewer und Context-Retriever benötigen normalerweise keine Schreibrechte.

Das wird im Template nicht nur beschrieben, sondern über die Agent-Permissions abgebildet.

## `.project/` schützen

Produktivcode und persistenter Workflow-Zustand sind getrennt.

Der Coder bearbeitet Code.

Der `workflow-syncer` aktualisiert nach einem abgeschlossenen Step den offiziellen Zustand unter `.project/`.

So kann nicht derselbe Agent einfach Code schreiben und anschließend selbst behaupten, alles sei erfolgreich abgeschlossen.

## Permission ist keine komplette Sandbox

Auch technische Permissions ersetzen kein Verständnis der verwendeten Tools und der Umgebung.

Aber sie reduzieren den möglichen Schadensradius deutlich und machen Rollen nachvollziehbarer.
