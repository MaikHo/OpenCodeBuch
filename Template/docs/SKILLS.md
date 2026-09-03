# OpenCode Skills im Template

Skills liegen unter `.opencode/skills/<name>/SKILL.md`. Sie sind wiederverwendbare Regeln, keine Commands und keine autonomen Agenten.

| Skill | Zweck |
|---|---|
| `change-governance` | Scope, Freigaben, kleine Diffs und Sicherheitsgrenzen |
| `context-control` | Start mit `activeContext`/`current.yaml`/aktiver Spec+Plan; nur benötigten Context laden |
| `work-checkpoint` | einen real verifizierten Step vollständig persistieren |
| `resume-work` | Zustand rekonstruieren und nächsten Step nur anzeigen, nicht automatisch starten |
| `architecture-knowledge` | `observed`, `decided`, `unknown`, `conflict` mit Evidence/Quelle sauber trennen |
| `workflow-guide` | Bedienungsfragen aus der Repository-Dokumentation beantworten |
| `project-context` | `.project/` gezielt lesen und dauerhaftes Wissen bewusst pflegen |
| `small-step-workflow` | genau ein Problem pro Step; nach Abschluss STOP |
| `git-checkpoint` | Git-Diff vor einem bewussten Benutzer-Commit prüfen |
| `code-review` | allgemeine read-only Review-Regeln |

## Wichtig

Ein Skill darf die Agenten-Permissions nicht umgehen. Wenn ein Agent read-only ist, macht ein Skill ihn nicht schreibend.
