# Datei-Referenz – OpenCode- und Workflow-Dateien

Diese Datei ist die technische Landkarte des Templates.

## 1. Führende Quellen

| Information | Führende Datei | Abgeleitete Sicht |
|---|---|---|
| Projektziel/Rahmen | `.project/projekt.md` | – |
| Architekturdetails | `.project/architecture.md` | Architektur-Fingerprint |
| bekannte Entscheidungen | `.project/entscheidungen.md` | – |
| aktueller Work-State | `.project/work/current.yaml` | `activeContext.md`, `RESUME.md` |
| Inhalt/Status eines Steps | aktiver Plan unter `.project/plans/active/` | `current.yaml`, `activeContext.md` |
| aktuelle Übersicht | – | `.project/activeContext.md` |
| Session-Übergabe | – | `.project/work/RESUME.md` |
| abgeschlossene Einheit | `.project/work/checkpoints/` | – |
| abgeschlossene Änderungshistorie | `.project/CHANGELOG.md` | – |
| tatsächliche Dateiänderungen | Git-Diff | – |

Bei Konflikten gilt `.project/README.md`.

---

## 2. Root

| Datei | Zweck |
|---|---|
| `AGENTS.md` | allgemeine Governance, Step Boundary, Technologie-Trennung und Freigaberegeln |
| `README.md` | normale Projektdokumentation für Menschen |
| `.gitignore` | projektspezifische Git-Ausschlüsse |

---

## 2a. OpenCode-Konfiguration

| Datei | Zweck |
|---|---|
| `config/opencode.ollama.example.json` | vollständige Ollama-Projektkonfiguration mit Provider, Modellplatzhalter, Default-Agent und Workflow-Permissions |
| `config/opencode.lmstudio.example.json` | vollständige LM-Studio-Projektkonfiguration mit Provider, Modellplatzhalter, Default-Agent und Workflow-Permissions |
| `.opencode/opencode.example.json` | providerunabhängiger Workflow-Konfigurationsausschnitt für bestehende eigene Setups |

Die tatsächlich aktive Datei heißt `opencode.json` und liegt im Projektroot. Sie muss an den gewählten Provider und die eigene Umgebung angepasst werden.

---

## 3. `.opencode/agents/`

### Workflow-Agenten

| Datei | Zweck | Schreiben |
|---|---|---|
| `workflow-guide-agent.md` | technologieunabhängige Hilfe und Agentenwahl | nein |
| `workflow-syncer.md` | synchronisiert ausschließlich `.project/` | nur `.project/**`, nach Nachfrage |

### .NET-Agenten

| Datei | Zweck |
|---|---|
| `net-openagent.md` | .NET-Einstieg/Routing |
| `net-context-retriever.md` | .NET-Repository-Bestandsaufnahme |
| `net-spec-writer.md` | .NET-Spezifikation und Spec→Plan-Vorbereitung |
| `net-plan-writer.md` | .NET-Arbeitsplanung |
| `net-coder.md` | kontrollierte .NET-Umsetzung |
| `net-reviewer.md` | read-only .NET-Review |
| `net-documentation.md` | technische .NET-Erstdokumentation |
| `net-doc-syncer.md` | .NET-Doku-Synchronisation |
| `net-editor.md` | technische Textüberarbeitung |
| `net-toolsmith.md` | kleine deterministische .NET-Hilfswerkzeuge |

### C++-Agenten

| Datei | Zweck |
|---|---|
| `cpp-context-retriever.md` | C++-Repository, Buildsystem und Toolchain inventarisieren |
| `cpp-coder.md` | kontrollierte kleine C++-Änderungen |
| `cpp-reviewer.md` | read-only C++-Review inkl. Ownership/RAII/API-/ABI-Risiken |

---

## 4. `.opencode/commands/`

### Persistenter Workflow

| Datei | Aufruf | Agent | Zweck |
|---|---|---|---|
| `help-workflow.md` | `/help-workflow` | `workflow-guide-agent` | Repository-Hilfe |
| `create-spec-to-plan.md` | `/create-spec-to-plan <Anforderung>` | `net-spec-writer` | Spec → Freigabe → Plan → Freigabe; keine Implementierung |
| `work-start.md` | `/work-start` | `workflow-syncer` | freigegebenen Plan als Work-State aktivieren |
| `work-status.md` | `/work-status` | `workflow-syncer` | Work-State read-only anzeigen |
| `work-continue.md` | `/work-continue` | `workflow-syncer` | Zustand rekonstruieren; nächsten möglichen Step nur anzeigen |
| `context-compact.md` | `/context-compact` | `workflow-syncer` | Resume-Vorschlag und nach Freigabe persistieren |
| `complete-step.md` | `/complete-step T-xxx` | `workflow-syncer` | einen real verifizierten Step abschließen und Zustand synchronisieren |
| `work-finish.md` | `/work-finish` | `workflow-syncer` | Arbeit nach Freigabe abschließen/archivieren |
| `update-context.md` | `/update-context` | `workflow-syncer` | langfristigen `.project`-Kontext nach Freigabe aktualisieren |

### Mitgelieferte .NET-orientierte Commands

| Datei | Aufruf | Zweck |
|---|---|---|
| `analyze.md` | `/analyze <Aufgabe>` | fokussierte read-only Analyse |
| `repo-inventory.md` | `/repo-inventory` | .NET-Repository inventarisieren |
| `project-context.md` | `/project-context` | technischen Projektkontext vorbereiten |
| `structure-work.md` | `/structure-work <Aufgabe>` | unscharfe Anforderung strukturieren |
| `implement-change.md` | `/implement-change <Aufgabe>` | kleine .NET-Änderung nach Freigabe |
| `next-step.md` | `/next-step T-xxx` | genau einen .NET-Step ausdrücklich freigeben und umsetzen |
| `review-step.md` | `/review-step` | letzten Scope read-only prüfen |
| `review-dotnet.md` | `/review-dotnet <Scope>` | .NET-Review |
| `bug-dataflow.md` | `/bug-dataflow <Problem>` | .NET/UI-Datenflussanalyse |
| `readme-draft.md` | `/readme-draft` | README-Vorschlag |
| `git-checkpoint.md` | `/git-checkpoint` | technologieunabhängigen Git-Diff prüfen; kein Commit/Push |

C++ wird über die `cpp-*`-Agenten direkt bedient. Eigene Commands können projektspezifisch ergänzt werden.

---

## 5. `.opencode/skills/`

| Skill | Zweck |
|---|---|
| `change-governance` | Freigabe-, Scope- und Sicherheitsregeln vor Änderungen |
| `context-control` | minimalen Context laden; `activeContext`/Spec/Plan berücksichtigen |
| `work-checkpoint` | Abschluss eines verifizierten Steps persistieren |
| `resume-work` | Zustand rekonstruieren, ohne `next_step` als Freigabe zu behandeln |
| `architecture-knowledge` | `observed`, `decided`, `unknown`, `conflict` mit Evidence/Quelle trennen |
| `workflow-guide` | Repository-Dokumentation für Bedienungsfragen nutzen |
| `project-context` | `.project/` gezielt lesen/pflegen |
| `small-step-workflow` | genau einen Step pro Freigabe; danach STOP |
| `git-checkpoint` | Git-Diff vor Benutzer-Commit prüfen |
| `code-review` | wiederverwendbare Review-Regeln |

---

## 6. `.project/`

### Root-Dateien

| Datei | Zweck |
|---|---|
| `.project/README.md` | **Vertrag des gesamten persistenten Zustands**; Source-of-Truth-Hierarchie und Lifecycle |
| `.project/activeContext.md` | sehr kleines Dashboard; abgeleitete Sicht; max. wenige aktuelle Punkte |
| `.project/projekt.md` | stabile Projektziele und Rahmenbedingungen |
| `.project/architecture.md` | ausführliche Architektur und Grenzen |
| `.project/tech.md` | Technologien, Runtime, Buildsystem und technische Randbedingungen |
| `.project/entscheidungen.md` | tatsächlich getroffene Entscheidungen und bekannte Begründungen |
| `.project/tasks.md` | allgemeine Aufgaben außerhalb des aktiven Plans |
| `.project/bugs.md` | bekannte Fehler und Workarounds |
| `.project/CHANGELOG.md` | Historie abgeschlossener/verifizierter Workflow-Steps |

### `.project/context/`

| Datei | Zweck |
|---|---|
| `repository.md` | kompakte stabile Repository-Bestandsaufnahme |
| `architecture-fingerprint.yaml` | kleine Navigationskarte: Style, Entry Points, Module, Boundaries und klassifiziertes Architekturwissen |

Für `knowledge.items` gilt:

```text
observed → Evidence erforderlich
 decided → Reason + Source erforderlich
 unknown → kein erfundener Grund
 conflict → alle widersprechenden Quellen erhalten
```

### `.project/specs/`

```text
backlog/  → vorgeschlagen/noch nicht aktiv
active/   → freigegebene aktive Spec
done/     → abgeschlossene Spec
```

Spec beantwortet: **Was und warum?**

### `.project/plans/`

```text
active/   → aktuell freigegebener Plan
archive/  → abgeschlossene Pläne
```

Plan beantwortet: **Wie?** und enthält Steps mit `Do`, `Verify`, `Verified`.

### `.project/work/`

| Datei/Ordner | Zweck |
|---|---|
| `current.yaml` | führender maschinenlesbarer Work-State |
| `RESUME.md` | abgeleitete Übergabe für neue Session/Context |
| `checkpoints/` | abgeschlossene Arbeitseinheiten mit realer Verifikation |
| `history/` | optionale Abschlusszusammenfassungen längerer Arbeiten |

`next_step` ist niemals eine Freigabe.

---

## 7. Synchronisation nach einem Step

```text
aktiver Plan
→ Checkpoint
→ current.yaml
→ activeContext.md
→ RESUME.md
→ CHANGELOG.md
→ STOP
```

Diese Reihenfolge ist verbindlich für `/complete-step` und `workflow-syncer`.
