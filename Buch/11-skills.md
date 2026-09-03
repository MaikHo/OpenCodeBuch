# 11. Skills – Wissen bei Bedarf laden

Ein Skill ist wiederverwendbares Arbeitswissen.

Er liegt unter:

```text
.opencode/skills/<name>/SKILL.md
```

Das Template enthält aktuell:

```text
architecture-knowledge
change-governance
code-review
context-control
git-checkpoint
project-context
resume-work
small-step-workflow
work-checkpoint
workflow-guide
```

## Warum nicht alles in `AGENTS.md`?

Weil `AGENTS.md` bei jeder Session relevant ist.

Ein spezieller Code-Review-Ablauf oder Regeln zum Architekturwissen werden aber nicht bei jeder Aufgabe gebraucht.

Skills halten dieses Wissen verfügbar, ohne es permanent in den Context zu laden.

## Agent oder Skill?

Eine einfache Regel:

```text
Wer arbeitet?
→ Agent

Wie wird eine spezielle Aufgabe bearbeitet?
→ Skill
```

Beispiel:

`net-reviewer` ist eine Rolle.

`code-review` ist das wiederverwendbare Prüfwissen.

## Skills müssen konkret sein

Ein guter Skill beschreibt nicht nur:

```text
Prüfe den Code gut.
```

Sondern beispielsweise:

- welche Fakten benötigt werden,
- welche Annahmen verboten sind,
- welche Reihenfolge sinnvoll ist,
- wie Unsicherheit gekennzeichnet wird,
- welches Ergebnis erwartet wird.

Damit wird ein Skill reproduzierbares Arbeitswissen statt ein weiterer langer Prompt.
