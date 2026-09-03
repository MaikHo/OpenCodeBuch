# Entwicklung des kontrollierten OpenCode-Templates

## Ziel

Der Workflow wurde schrittweise so aufgebaut, dass lange Aufgaben und begrenzte Modellkontexte nicht vom Chatverlauf abhängig sind. Dieses Dokument erklärt die heute vorhandenen Schichten; es definiert keinen zusätzlichen Workflow.

## Beibehaltene Grundsätze

- `AGENTS.md` bleibt zentrale Governance-Datei.
- Alle mitgelieferten Agenten sind Primary Agents; `task` ist gesperrt.
- Keine automatische Agenten-Kaskade.
- Schreiboperationen bleiben kontrolliert.
- Commit und Push werden nicht automatisiert.
- Bestehende Technologie- und Architekturentscheidungen werden respektiert.
- Eine Freigabe gilt nur für genau einen genannten Step.

## Persistenter Projektzustand

`.project/` trennt dauerhaftes Projektwissen vom aktuellen Arbeitszustand:

```text
.project/
├── README.md
├── activeContext.md
├── context/
├── specs/
├── plans/
└── work/
```

Die Source-of-Truth-Regeln stehen verbindlich in `.project/README.md`.

## Spec → Plan → Step

Größere .NET-Änderungen können über `/create-spec-to-plan` vorbereitet werden. Spec und Plan werden separat freigegeben. Erst danach aktiviert `/work-start` den persistenten Work-State. Der erste Step startet nicht automatisch.

## Skills

Die querschnittlichen Regeln sind in Skills gekapselt:

- `change-governance`
- `context-control`
- `work-checkpoint`
- `resume-work`
- `architecture-knowledge`
- `workflow-guide`
- `project-context`
- `small-step-workflow`
- `git-checkpoint`
- `code-review`

Skills ergänzen Agenten, überschreiben aber keine Permissions.

## Workflow-Agenten

- `workflow-guide-agent` beantwortet Bedienungsfragen und empfiehlt eine passende Agentenfamilie.
- `workflow-syncer` darf ausschließlich persistenten Zustand unter `.project/` synchronisieren.

Technologiespezifische Rollen tragen ihren Stack im Namen (`net-*`, `cpp-*`).

## Context-Strategie

Nicht:

```text
alten Chat rekonstruieren
+ gesamtes Repository neu lesen
+ abgeschlossene Arbeit wiederholen
```

Sondern:

```text
AGENTS.md
+ activeContext.md
+ current.yaml
+ aktive Spec / aktiver Plan
+ letzter Checkpoint
+ RESUME.md
+ nur relevante Dateien
```

`next_step` beschreibt lediglich den logisch möglichen nächsten Step und autorisiert ihn nicht.

## Abschluss eines Steps

Nach realer Verifikation wird ein Step in dieser Reihenfolge persistiert:

```text
aktiver Plan
→ Checkpoint
→ current.yaml
→ activeContext.md
→ RESUME.md
→ CHANGELOG.md
→ STOP
```

Damit bleiben Chat, Modell und Session austauschbar, während der relevante Arbeitszustand im Repository erhalten bleibt.
