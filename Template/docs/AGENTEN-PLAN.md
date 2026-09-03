# Agenten und Commands – Überblick

Das Template trennt **Workflow-Agenten** von **technologiespezifischen Agenten**. Dadurch ist sofort erkennbar, welche Regeln allgemein gelten und welche nur für einen Stack gedacht sind.

## 1. Workflow-Agenten

| Agent | Zweck | Schreibrechte |
|---|---|---|
| `workflow-guide-agent` | technologieunabhängiger Einstieg, Workflow-Hilfe und Agentenempfehlung | read-only |
| `workflow-syncer` | synchronisiert ausschließlich persistenten Zustand unter `.project/` | nur `.project/**`, jeweils `ask` |

### `workflow-syncer`

Der Agent ist bewusst kein Coder. Er darf keine Produktivdateien ändern. Er wird für Commands eingesetzt, die Zustand persistieren:

- `/work-start`
- `/work-continue`
- `/work-status`
- `/context-compact`
- `/complete-step T-xxx`
- `/work-finish`
- `/update-context`

Führende Quellen und Synchronisationsreihenfolge stehen in `.project/README.md`.

---

## 2. .NET-Agenten

Alle .NET-spezifischen Rollen tragen `net-` im Namen.

| Agent | Zweck | Schreibrechte |
|---|---|---|
| `net-openagent` | .NET-spezifisches Routing und Einordnung | read-only |
| `net-context-retriever` | .NET-Repository inventarisieren und Kontext gewinnen | read-only |
| `net-spec-writer` | lösungsneutrale Spec und Plan-Vorbereitung für .NET | `edit: ask` |
| `net-plan-writer` | .NET-Arbeit in kleine, risikoarme Schritte strukturieren | `edit: ask` |
| `net-coder` | genau freigegebene .NET-Änderung umsetzen | `edit: ask` |
| `net-reviewer` | .NET-Code/Architektur/Risiken prüfen | read-only |
| `net-documentation` | technische Erst-Dokumentation für .NET-Repositories | `edit: ask` |
| `net-doc-syncer` | bestehende Doku nach akzeptierten .NET-Änderungen synchronisieren | `edit: ask` |
| `net-editor` | technische Texte sprachlich überarbeiten | `edit: ask` |
| `net-toolsmith` | kleine Hilfswerkzeuge für .NET-Repositories entwerfen | `edit: ask` |

Die Agenten respektieren bestehende Frameworks und Projekttypen. Sie führen keine Framework-Upgrades oder Architekturwechsel als Nebeneffekt durch.

---

## 3. C++-Agenten

C++ ist als optionale zweite Technologie-Familie enthalten.

| Agent | Zweck | Schreibrechte |
|---|---|---|
| `cpp-context-retriever` | C++-Repository, Buildsystem, Toolchain und Modulstruktur inventarisieren | read-only |
| `cpp-coder` | genau freigegebene kleine C++-Änderungen umsetzen | `edit: ask` |
| `cpp-reviewer` | C++-Diff, Ownership/RAII, API-/ABI- und Buildrisiken prüfen | read-only |

Die C++-Agenten modernisieren weder C++-Standard noch CMake/Meson/Make oder Dependency-Management ungefragt.

---

## 4. Commands

### Workflow-Kern

| Command | Zweck | Agent |
|---|---|---|
| `/help-workflow` | Repository-Hilfe | `workflow-guide-agent` |
| `/create-spec-to-plan <Anforderung>` | größere .NET-Änderung: Spec → Freigabe → Plan → Freigabe | `net-spec-writer` |
| `/work-start` | freigegebenen Plan als Work-State aktivieren | `workflow-syncer` |
| `/work-status` | persistenten Zustand anzeigen | `workflow-syncer` |
| `/work-continue` | Zustand rekonstruieren und nächsten möglichen Step anzeigen | `workflow-syncer` |
| `/context-compact` | Resume-Kontext vorbereiten und nach Freigabe persistieren | `workflow-syncer` |
| `/complete-step T-xxx` | genau einen verifizierten Step abschließen | `workflow-syncer` |
| `/work-finish` | längere Arbeit nach Freigabe abschließen/archivieren | `workflow-syncer` |
| `/update-context` | langlebiges Projektwissen vorschlagen und nach Freigabe synchronisieren | `workflow-syncer` |
| `/git-checkpoint` | technologieunabhängigen Git-Diff prüfen; kein Commit/Push | `workflow-guide-agent` |

### Mitgelieferte .NET-Commands

| Command | Zweck |
|---|---|
| `/analyze <Aufgabe>` | fokussierte read-only Analyse |
| `/repo-inventory` | .NET-Repository inventarisieren |
| `/project-context` | technischen Projektkontext vorbereiten |
| `/structure-work <Aufgabe>` | unscharfe Änderung strukturieren |
| `/implement-change <Aufgabe>` | kleine klar begrenzte .NET-Änderung |
| `/next-step T-xxx` | genau einen .NET-Step ausdrücklich freigeben und umsetzen |
| `/review-step` | letzten Schritt read-only prüfen |
| `/review-dotnet <Scope>` | .NET-spezifischer Review |
| `/bug-dataflow <Problem>` | optionaler .NET/UI-Datenfluss-Review |
| `/readme-draft` | README-Entwurf erzeugen |

C++-Agenten werden aktuell direkt ausgewählt. Eigene projektspezifische Commands können später mit wenigen Zeilen auf diese Agenten zeigen.

---

## 5. Kein autonomes Agentennetz

Alle Agenten sind Primary Agents. `task` ist gesperrt. Ein Agent empfiehlt gegebenenfalls eine andere Rolle, startet sie aber nicht autonom.

```text
Mensch
→ Command oder Agent auswählen
→ genau eine Aktion
→ Ergebnis prüfen
→ nächste Freigabe bewusst erteilen
```
