# Modell, Agent und OpenCode – wer macht eigentlich was?

Dieses Dokument erklärt die Rollen im Template unabhängig von einem bestimmten Modell oder Provider.

## Kurzfassung

```text
LLM / Modell
    ↓ erzeugt Entscheidungen und Tool-Aufrufe
OpenCode
    ↓ stellt Agenten, Tools und Permissions bereit
Agentendatei
    ↓ gibt Rolle und Arbeitsregeln vor
AGENTS.md + Skills + Projektkontext
    ↓ liefern Regeln und benötigtes Wissen
Repository
```

Das Sprachmodell ist nicht selbst der Agent. Erst OpenCode kombiniert das ausgewählte Modell mit Agentendefinition, Werkzeugen, Permissions und Projektkontext.

## 1. Das Modell

Das Modell verarbeitet den aktuellen Kontext und erzeugt Antworten beziehungsweise Tool-Aufrufe. Welches Modell verwendet wird, ist Sache der OpenCode-Konfiguration. Das Template setzt kein bestimmtes Modell und keinen bestimmten Provider voraus.

Beispiele können Ollama, LM Studio oder Cloud-Provider verwenden. Modellname, Provider und Context-Limit gehören deshalb in die OpenCode-Konfiguration und nicht in die Workflow-Regeln.

## 2. OpenCode

OpenCode ist die ausführende Umgebung. Es stellt unter anderem bereit:

- Agenten,
- Commands,
- Skills,
- Datei- und Suchwerkzeuge,
- Shell-/LSP-Werkzeuge, sofern konfiguriert,
- Permissions.

Wenn ein Modell beispielsweise eine Datei ändern möchte, erzeugt es einen entsprechenden Tool-Aufruf. OpenCode prüft anschließend die konfigurierten Permissions und führt den Aufruf aus, blockiert ihn oder fordert eine Bestätigung an.

## 3. Agenten

Agenten liegen unter:

```text
.opencode/agents/
```

Sie definieren eine Rolle. Das gleiche Modell kann dadurch je nach Agent anders arbeiten.

```text
Modell + workflow-guide-agent.md → technologieunabhängiger Einstieg
Modell + workflow-syncer.md      → nur .project-Zustand synchronisieren
Modell + net-coder.md            → kontrollierte .NET-Umsetzung
Modell + net-reviewer.md         → read-only .NET-Review
Modell + cpp-coder.md            → kontrollierte C++-Umsetzung
Modell + cpp-reviewer.md         → read-only C++-Review
```

Die Agentendatei ändert also nicht das Modell, sondern dessen Aufgabe, Regeln und verfügbare Werkzeuge.

## 4. Commands

Commands liegen unter:

```text
.opencode/commands/
```

Sie bilden häufig wiederkehrende Arbeitsabläufe ab, beispielsweise:

```text
/work-start
/work-continue
/context-compact
/complete-step
```

Ein Command ist kein eigenständiges Gedächtnis. Dauerhafter Arbeitszustand wird im Repository unter `.project/` gespeichert.

Wenn ein Command im Frontmatter einen `agent` angibt, aktiviert OpenCode diesen Agenten für den Command und er wird zum aktiven Agenten der Session. Das ist im Workflow absichtlich genutzt: `/work-start` und `/complete-step` wechseln auf `workflow-syncer`; `/next-step T-xxx` wechselt für die .NET-Umsetzung auf `net-coder`. Für C++ wird `cpp-coder` bewusst ausgewählt.

## 5. Skills

Skills liegen unter:

```text
.opencode/skills/<skill>/SKILL.md
```

Sie enthalten wiederverwendbare Regeln oder Fähigkeiten. Der vollständige Skill-Inhalt soll nur dann geladen werden, wenn er für die aktuelle Aufgabe benötigt wird. Das spart Kontext.

## 6. Permissions

Textregeln allein sind keine technische Zugriffskontrolle. Kritische Grenzen werden zusätzlich über OpenCode-Permissions definiert.

Beispielprinzip:

```text
read/search → allow
edit        → ask oder deny
gefährliche Shell-Aktionen → deny
```

Die konkrete Konfiguration hängt vom Projekt und vom verwendeten Agenten ab. Siehe [PermissionTools.md](PermissionTools.md).

## 7. Kontext

Zum Modellkontext gehören beispielsweise:

```text
Agentenanweisung
+ AGENTS.md
+ Benutzeranfrage
+ gelesene Dateien
+ Suchergebnisse
+ Tool-Ausgaben
+ geladene Skills
+ aktive Spec und aktiver Plan
```

Mehr Kontext ist nicht automatisch besser. Darum hält das Template stabilen Projektzustand außerhalb des Chats.

## 8. Persistenter Zustand

```text
.project/activeContext.md
.project/work/current.yaml
.project/work/RESUME.md
.project/specs/
.project/plans/
.project/work/checkpoints/
```

Der Chat ist temporärer Arbeitsspeicher. Das Repository ist der dauerhafte Arbeitszustand.

## 9. Context-Reset

Vor einem Context-Wechsel kann `/context-compact` den notwendigen Fortsetzungszustand aktualisieren. In einer neuen Session verwendet `/work-continue` nur die Informationen, die für den nächsten Schritt benötigt werden.

Dadurch ist der Workflow unabhängig vom Gedächtnis eines bestimmten Modells.

## 10. Autonomiegrenze

Das Template ist ausdrücklich nicht für autonomes Durcharbeiten kompletter Pläne gebaut.

```text
Step freigeben
→ umsetzen
→ verifizieren
→ Zustand aktualisieren
→ Ergebnis zeigen
→ STOP
```

Eine Freigabe für einen Step ist keine Freigabe für den nächsten.
