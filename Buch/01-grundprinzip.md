# 1. Das Grundprinzip

Ein Coding-Agent kann sehr schnell sehr viel ändern. Genau das ist gleichzeitig seine Stärke und das größte Risiko.

Ich möchte deshalb nicht so arbeiten:

```text
Hier ist mein Projekt. Bau Funktion X ein und mach alles fertig.
```

Das klingt bequem, erzeugt aber einen großen Arbeitsblock. Wenn dabei eine falsche Annahme entsteht, zieht sie sich durch mehrere Dateien und möglicherweise durch die Architektur.

Mein Workflow trennt deshalb vier Dinge:

```text
verstehen
→ planen
→ genau einen Step bearbeiten
→ Zustand nachvollziehbar festhalten
```

## Eine Freigabe gilt nur für genau einen Step

Das ist eine der wichtigsten Regeln des gesamten Workflows.

Wenn im Plan steht:

```text
T-003
```

und ich diesen Step freigebe, bedeutet das nicht:

```text
T-003
→ danach T-004
→ danach T-005
```

Es bedeutet ausschließlich:

```text
T-003 bearbeiten
→ verifizieren
→ Zustand aktualisieren
→ STOP
```

Erst danach entscheide ich wieder.

## Der Chat ist nicht der Projektzustand

Ein weiterer Grundsatz lautet:

> Was für die Fortsetzung der Arbeit wichtig ist, gehört ins Repository und nicht nur in den Chat.

Dafür gibt es im Template unter anderem:

```text
.project/activeContext.md
.project/work/current.yaml
.project/work/RESUME.md
.project/specs/
.project/plans/
.project/CHANGELOG.md
```

Damit kann eine neue OpenCode-Session wieder einsteigen, ohne dass der alte Chatverlauf die einzige Wissensquelle ist.

## Kein Prozess um des Prozesses willen

Nicht jede Änderung braucht eine Spec und einen Plan.

Eine kleine, klar begrenzte Änderung darf klein bleiben. Erst bei größeren oder riskanteren Aufgaben lohnt sich der vollständige Ablauf mit Spec, Plan und einzelnen Steps.

Das Ziel ist nicht Bürokratie.

Das Ziel ist Kontrolle mit möglichst wenig zusätzlicher Arbeit.
