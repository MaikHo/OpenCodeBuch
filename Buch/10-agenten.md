# 10. Agenten – klare Rollen und Rechte

Ich möchte nicht einen Universalagenten, der alles lesen, ändern, committen und nebenbei noch die Architektur neu erfinden darf.

Agenten bekommen deshalb klar abgegrenzte Rollen.

Sie liegen unter:

```text
.opencode/agents/
```

## Technologieunabhängige Workflow-Agenten

```text
workflow-guide-agent
workflow-syncer
```

`workflow-guide-agent` ist der read-only Einstiegspunkt. Er erklärt den Workflow und hilft bei der Auswahl des passenden Ablaufs.

`workflow-syncer` darf den persistenten Zustand unter `.project/` synchronisieren. Er soll keinen Produktivcode verändern.

## .NET-Agenten

Weil diese Rollen technologiespezifisch sind, steht `net-` im Namen:

```text
net-openagent
net-context-retriever
net-spec-writer
net-plan-writer
net-coder
net-reviewer
net-documentation
net-doc-syncer
net-editor
net-toolsmith
```

Damit sieht man schon am Namen, dass die Rolle nicht für jedes Projekt gedacht ist.

## C++-Agenten

Das Template enthält zusätzlich:

```text
cpp-context-retriever
cpp-coder
cpp-reviewer
```

Auch hier gilt: Die Technologie steht im Namen.

## Warum verschiedene Agenten?

Weil Rechte Teil des Designs sind.

Ein Reviewer benötigt normalerweise keine Schreibrechte.

Ein Context-Retriever soll analysieren, nicht nebenbei Dateien verändern.

Ein Coder darf Sourcecode bearbeiten, aber nicht selbst den offiziellen Work-State unter `.project/` umschreiben.

Die Trennung ist damit nicht nur organisatorisch, sondern technisch über Permissions abgesichert.

## Keine Agentenschwärme aus Prinzip

Mehr Agenten sind nicht automatisch besser.

Ich baue eine neue Rolle nur dann, wenn sie eine wirklich andere Verantwortung oder andere Rechte braucht.
