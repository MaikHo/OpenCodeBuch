# Benutzerhandbuch – OpenCode-Workflow

Dieses Handbuch ist zum **schnellen Nachschlagen während der täglichen Arbeit mit OpenCode** gedacht.

Es erklärt nicht jedes technische Detail. Dafür gibt es die weiteren Dokumente unter `docs/`. Hier geht es um die praktische Frage:

> Ich sitze gerade in OpenCode. Was mache ich jetzt?

---

## 1. Die fünf Regeln, die immer gelten

1. **Der Mensch führt die Arbeit.** OpenCode analysiert, plant und setzt nach Freigabe um.
2. **Eine Freigabe gilt nur für genau den genannten Schritt.** Ein fertiger Step erlaubt nicht automatisch den nächsten.
3. **Kleine Aufgaben bleiben klein.** Keine Nebenrefactorings und keine ungefragten Architekturänderungen.
4. **Der Repository-Zustand ist wichtiger als der Chat.** Längere Arbeit wird unter `.project/` persistiert.
5. **Nach einem abgeschlossenen Step wird gestoppt.** Zustand synchronisieren, Ergebnis zeigen, `STOP`.

Kurzform:

```text
verstehen
→ planen
→ genau einen Schritt freigeben
→ umsetzen
→ verifizieren
→ dokumentieren
→ STOP
```

---

## 2. Vor dem ersten Start

Das Template benötigt eine projektspezifische `opencode.json` im Projektroot. Unter `config/` liegen vollständige Beispiele für Ollama und LM Studio.

```bash
cp config/opencode.ollama.example.json opencode.json
```

oder:

```bash
cp config/opencode.lmstudio.example.json opencode.json
```

Danach `MODEL-ID` und bei Bedarf Host/Port anpassen. Die Beispiele enthalten bereits `workflow-guide-agent` als Default-Agent sowie die Workflow-Permissions.

Wer einen Cloud-Provider wie OpenAI verwenden möchte, kann `.opencode/opencode.example.json` als providerneutrale Basis für `opencode.json` verwenden. Danach den Anbieter in OpenCode mit `/connect` verbinden und das gewünschte Modell über `/models` auswählen. Der Workflow selbst ändert sich dadurch nicht.

Wichtig für die Bedienung: Commands mit einem eingetragenen `agent` wechseln in OpenCode auf diesen Agenten. Deshalb wird nach `/work-start` nicht einfach freier Codeauftrag geschrieben, sondern für .NET gezielt `/next-step T-xxx` verwendet beziehungsweise für C++ `cpp-coder` ausgewählt.

Einige Commands verwenden POSIX-Shell-Befehle und sind deshalb für Linux, macOS oder WSL ausgelegt. Unter nativem Windows müssen diese Command-Blöcke projektspezifisch auf PowerShell angepasst werden.

---

## 3. Welchen Command brauche ich?

| Ich möchte ... | Command | Ändert Dateien? |
|---|---|---:|
| wissen, wie der Workflow funktioniert | `/help-workflow` | Nein |
| einen Bereich nur analysieren | `/analyze <Aufgabe>` | Nein |
| ein unbekanntes Repository grob verstehen | `/repo-inventory` | Nein |
| stabilen Repository-Kontext erstellen/aktualisieren | `/project-context` | Erst nach `Übernehmen` |
| eine kleine, klar begrenzte Änderung durchführen | `/implement-change <Aufgabe>` | Erst nach `Übernehmen` |
| genau einen .NET-Step ausdrücklich freigeben und umsetzen | `/next-step T-xxx` | Ja, nur dieser Step |
| einen bereits freigegebenen Plan als längere Arbeit aktivieren | `/work-start` | Kontrolliert |
| eine Anforderung erst in Arbeitspakete zerlegen | `/structure-work <Aufgabe>` | Nein bzw. erst nach Freigabe |
| eine größere .NET-Änderung von Spec bis Plan vorbereiten | `/create-spec-to-plan <Anforderung>` | In zwei getrennten Freigabestufen |
| genau einen fertigen Step abschließen | `/complete-step T-xxx` | Ja, Zustandsdateien |
| nach neuer Session weiterarbeiten | `/work-continue` | Nicht automatisch |
| den aktuellen Arbeitsstand sehen | `/work-status` | Nein |
| vor Context-Reset einen kleinen Resume-Kontext erzeugen | `/context-compact` | Erst nach `Übernehmen` |
| eine längere Arbeit formal abschließen | `/work-finish` | Erst nach Freigabe |
| einen optionalen .NET-Scope prüfen lassen | `/review-dotnet <Scope>` | Nein |
| einen optionalen UI-/Binding-/State-Datenfluss analysieren | `/bug-dataflow <Problem>` | Nein |
| einen README-Entwurf erzeugen | `/readme-draft` | Nein |
| den letzten Schritt read-only prüfen | `/review-step` | Nein |
| dauerhafte Context-Änderungen vorschlagen und nach Freigabe übernehmen | `/update-context` | Erst nach `Übernehmen` |
| vor einem eigenen Commit einen Git-Checkpoint prüfen | `/git-checkpoint` | Nein |

Wenn du unsicher bist:

```text
/help-workflow Was ist für diese Aufgabe der richtige Einstieg?
```

---

### Step bewusst auswählen und freigeben

Bei einer laufenden Arbeit wird der nächste Step **nicht automatisch** aus `current.yaml` übernommen. Die Datei zeigt nur den gespeicherten Arbeitsstand; sie ist keine Freigabe.

Wenn du wissen willst, welcher Step als Nächstes vorgesehen ist:

```text
/work-status
```

Die Ausgabe zeigt zum Beispiel:

```text
Aktueller / nächster Step: T-003
```

Diesen Step gibst du anschließend bewusst frei:

```text
/next-step T-003
```

`/next-step` **ohne Step-ID startet keinen Step**. Die angegebene Step-ID ist die ausdrückliche Freigabe genau für diesen einen Arbeitsschritt.

Nach Umsetzung und realer Verifikation wird genau derselbe Step abgeschlossen:

```text
/complete-step T-003
```

Danach gilt wieder `STOP`. Ein eventuell bereits gespeicherter nächster Step ist noch nicht freigegeben.

---

## 4. Entscheidung: kleine oder größere Aufgabe?

### Kleine Aufgabe

Nimm `/implement-change`, wenn die Änderung:

- klar beschrieben ist,
- nur einen überschaubaren Scope betrifft,
- in einem kleinen Diff überprüfbar bleibt,
- keinen längeren Session-/Context-Wechsel erwarten lässt,
- keine neue Architekturentscheidung benötigt.

Beispiel:

```text
/implement-change Behandle eine leere Kundennummer im CustomerService als ungültige Eingabe.
```

Der Ablauf ist:

```text
Aufgabe
→ relevanten Code lesen
→ Umsetzungsplan zeigen
→ auf "Übernehmen" warten
→ Änderung durchführen
→ verifizieren
→ Ergebnis zeigen
→ STOP
```

### Größere Aufgabe

Nimm den persistenten Workflow, wenn:

- mehrere voneinander abhängige Schritte nötig sind,
- die Arbeit über mehrere Sessions gehen kann,
- mehrere Komponenten betroffen sind,
- wichtige Entscheidungen dokumentiert werden müssen,
- der Kontext bewusst klein gehalten werden soll.

Für eine größere .NET-Änderung beginnt der persistente Ablauf mit:

```text
/create-spec-to-plan <Anforderung>
```

Erst nachdem Spec und Plan jeweils separat geprüft und freigegeben wurden, wird der Work-State aktiviert:

```text
/work-start
```

Danach wird genau ein Step separat freigegeben. Eine Planfreigabe ist noch keine Freigabe für `T-001`.

Nicht jede Änderung braucht diesen Ablauf. Kleine, klar begrenzte Änderungen bleiben bei `/implement-change`.

---

## 5. Spec → Plan → Step

Für größere .NET-Änderungen gibt es einen gemeinsamen Einstieg:

```text
/create-spec-to-plan <Anforderung>
```

Der Command führt **nicht automatisch bis zur Implementierung**. Er enthält zwei getrennte Freigabegrenzen.

### Phase 1: Spec – Was und warum?

Die Spec beschreibt Ziel, Nicht-Ziele, Ist-/Soll-Zustand, Randbedingungen, Akzeptanzkriterien, Risiken und offene Fragen. Sie legt die technische Lösung noch nicht fest.

Ablauf:

```text
Spec-Vorschlag
→ STOP
→ du prüfst
→ "Spec übernehmen"
→ Spec wird persistent gespeichert
```

### Phase 2: Plan – Wie?

Danach entsteht ein Plan mit kleinen Steps. Jeder Step enthält mindestens:

```markdown
### T-003 — Blockweise Verarbeitung implementieren

Do:
Verarbeitung in kontrollierte Blöcke aufteilen.

Verify:
<Build-, Compiler-, Lint-, Skript- oder manueller Prüfschritt>

Verified:
NOT RUN
```

Dann wieder:

```text
Plan-Vorschlag
→ STOP
→ du prüfst
→ "Plan übernehmen"
→ aktive Spec + aktiver Plan werden gespeichert
→ STOP
```

Eine Planfreigabe ist **keine** Freigabe für `T-001`. Danach wird der persistente Work-State separat mit `/work-start` aktiviert.

### Step: genau eine Änderung

Für .NET gibst du immer genau einen Step mit dem Command frei:

```text
/next-step T-003
```

Die bewusste Command-Ausführung ist die Freigabe nur für `T-003` und wechselt auf `net-coder`. Für C++ wählst du `cpp-coder` bewusst und nennst genau den freigegebenen Step. Nach der Verifikation wird der Step mit `/complete-step T-003` abgeschlossen und der Zustand synchronisiert. Danach STOP.

## 6. Was bedeutet Verify / Verified?

Ein Step ist nicht abgeschlossen, nur weil Code geschrieben wurde.

```text
Änderung vorhanden
≠
Änderung nachgewiesen
```

`Verify` beschreibt **vorher**, wie das Ergebnis überprüft werden soll.

Mögliche Verifikationen sind beispielsweise:

```text
<Build-Kommando des Projekts>
Compiler/Linter
projektspezifisches Prüfkommando
Shell-/PowerShell-/Python-Skript
Diff-Prüfung
manuelle Prüfung
```

`Verified` dokumentiert **nachher**, was tatsächlich passiert ist.

Zulässige Zustände sind beispielsweise:

```text
NOT RUN
PASSED
FAILED
MANUAL REQUIRED
MANUAL VERIFIED
BLOCKED
```

Wichtige Regel:

> OpenCode darf niemals ein erfolgreiches `Verified` erfinden.

Wenn ein Kommando nicht ausgeführt wurde, bleibt das sichtbar.

---

## 7. Einen Step sauber abschließen

Nachdem ein freigegebener Step umgesetzt und verifiziert wurde:

```text
/complete-step T-003
```

Der Abschluss synchronisiert in verbindlicher Reihenfolge:

1. den Step im aktiven Plan,
2. einen Checkpoint unter `.project/work/checkpoints/`,
3. `.project/work/current.yaml`,
4. `.project/activeContext.md`,
5. `.project/work/RESUME.md`,
6. `.project/CHANGELOG.md`.

Beim Wechsel auf einen neuen aktuellen Step wird der Verifikationszustand in `current.yaml` wieder auf `not_run` gesetzt; ein Ergebnis des vorherigen Steps darf nicht weitergetragen werden.

Danach:

```text
Ergebnis zeigen
→ STOP
```

OpenCode beginnt **nicht** mit T-004.

Du entscheidest anschließend selbst, ob T-004 freigegeben wird.

---

## 8. Die wichtigsten Zustandsdateien

### `.project/activeContext.md`

Das kleine Dashboard für Mensch und Modell.

Enthält nur den aktuell wichtigen Zustand, zum Beispiel:

- aktueller Fokus,
- aktive Spec,
- aktiver Plan,
- aktueller Step,
- letzte relevante Änderungen,
- Blocker,
- nächster Schritt.

Die Datei soll bewusst klein bleiben.

### `.project/work/current.yaml`

Der strukturierte, maschinenlesbare Zustand einer längeren Arbeit.

Hier stehen beispielsweise:

- Work-ID,
- Status,
- Branch,
- Phase,
- aktive Spec,
- aktiver Plan,
- aktueller Step,
- nächster Step,
- letzter Checkpoint,
- offene Fragen und Risiken.

### `.project/work/RESUME.md`

Die Übergabe für eine neue Session oder einen neuen Modellkontext.

Sie enthält mehr Details als `activeContext.md`, aber nur das, was zum Fortsetzen benötigt wird.

### Warum drei Dateien?

```text
activeContext.md
→ schnelles Dashboard

current.yaml
→ strukturierter Work-State

RESUME.md
→ konkrete Übergabe für den nächsten Kontext
```

Sie sollen nicht drei unterschiedliche Geschichten erzählen. Beim Step-Abschluss werden sie synchronisiert.

---

## 9. Neue Session oder OpenCode neu gestartet

Nicht versuchen, den alten Chat nachzuerzählen.

Verwende:

```text
/work-continue
```

Die Wiederaufnahme liest in dieser Reihenfolge:

```text
AGENTS.md
→ activeContext.md
→ current.yaml
→ aktive Spec + aktiver Plan
→ letzter Checkpoint
→ RESUME.md
→ nur der für den möglichen nächsten Step notwendige Scope
```

Der dort gespeicherte `next_step` wird nur angezeigt. Er ist keine Freigabe.

Bereits abgeschlossene Schritte werden nicht vorsorglich neu erzeugt.

Wenn Repository und gespeicherter Work-State widersprüchlich sind, muss OpenCode anhalten und den Konflikt melden.

---

## 10. Context wird zu groß

Vor einem geplanten Context-Reset oder Modellwechsel:

```text
/context-compact
```

OpenCode erstellt einen Vorschlag für einen kleinen Resume-Kontext.

Er wird erst nach:

```text
Übernehmen
```

persistiert.

Danach kann ein neuer Modellkontext mit `/work-continue` fortsetzen.

Grundregel:

> Kontext ist Arbeitsfläche, nicht Langzeitgedächtnis.

---

## 11. Repository noch unbekannt

Erster Überblick:

```text
/repo-inventory
```

Das verändert nichts und beantwortet vor allem:

- Welche Projekte gibt es?
- Welche Einstiegspunkte sind sichtbar?
- Welche Technologien werden verwendet?
- Welche wichtigen Dateien existieren?
- Wo lohnt sich genaueres Lesen?

Wenn der ermittelte Kontext langfristig nützlich ist:

```text
/project-context
```

Damit wird nach Freigabe `.project/context/repository.md` aktualisiert.

Wichtig: Diese Datei ist **kein Repository-Dump**. Sie enthält nur stabile Fakten, die bei späteren Aufgaben erneutes Suchen sparen.

---

## 12. Architekturwissen richtig behandeln

Bei bestehenden Projekten unterscheiden wir vier Zustände:

| Zustand | Bedeutung |
|---|---|
| `observed` | direkt im Repository beobachtbar |
| `decided` | dokumentierte Entscheidung mit nachvollziehbarer Quelle |
| `unknown` | Grund ist nicht dokumentiert |
| `conflict` | zwei belastbare Quellen widersprechen sich |

Beispiel:

```text
Ein statischer DatabaseHelper existiert.
```

Das ist `observed`.

Daraus darf OpenCode **nicht** ableiten:

```text
Der Helper wurde aus Performancegründen statisch gebaut.
```

Wenn kein Grund dokumentiert ist:

```text
state: unknown
```

Bei `conflict` entscheidet OpenCode nicht selbst, welche Quelle "wahrscheinlich" stimmt.

---

## 13. Bestehende Architektur respektieren

Für Bestandsprojekte gilt:

> Plane gegen das Repository, wie es existiert – nicht gegen die Architektur, die das Modell lieber hätte.

Eine kleine Änderung ist kein Freibrief für:

- Repository Pattern,
- CQRS,
- Mediator,
- neue DI-Strukturen,
- neue Projektaufteilung,
- Frameworkwechsel,
- großflächige Modernisierung.

Eine Architekturänderung ist ein eigener Auftrag und benötigt eine eigene Freigabe.

---

## 14. Reviews und Analysen

### Optionaler technologiespezifischer .NET-Review

```text
/review-dotnet src/MyProject/Services
```

Der Reviewer ändert nichts. Er trennt Befund, Risiko und Vorschlag.

### Datenfluss-/UI-Problem

```text
/bug-dataflow Die Kundenliste lädt nach jeder Änderung mehrfach neu.
```

Geeignet insbesondere für:

- UI-/State-/Binding-Technologien des Projekts,
- WPF/Bindings,
- wiederholte Subscriptions,
- Commands, die mehrfach feuern,
- Reload-Schleifen,
- State-/Collection-Probleme.

Der Command startet als reine Analyse.

---

## 15. Welche `.project`-Datei ist führend?

Bei widersprüchlichen Angaben gilt nicht "die zuletzt gelesene Datei", sondern die definierte Zuständigkeit:

| Information | Führende Quelle |
|---|---|
| Work-State | `.project/work/current.yaml` |
| Step-Inhalt, `Do`, `Verify`, `Verified` | aktiver Plan |
| Überblick | `activeContext.md` – nur abgeleitete Sicht |
| Wiederaufnahme | `RESUME.md` – nur abgeleitete Sicht |
| Dateiänderungen | Git-Diff |

Die vollständige Regel steht in [../.project/README.md](../.project/README.md).

## 16. Git bleibt Sicherheitsnetz

Vor einer Änderung sollte nicht direkt auf `main` oder `master` gearbeitet werden.

Vor einem eigenen Commit mindestens prüfen:

```bash
git status
git diff --stat
git diff
```

Je nach Projekt zusätzlich den definierten Verifikationsweg ausführen, zum Beispiel:

```bash
<Build-Kommando des Projekts>
```

OpenCode führt nicht automatisch Commit oder Push aus.

Ohne ausdrückliche Freigabe niemals:

```text
git reset
git clean
Force-Push
Branches löschen
```

---

## 17. Wann brauche ich welchen Agenten?

Normalerweise wählst du zuerst den passenden Command. Falls du direkt mit einem Agenten arbeitest:

| Agent | Aufgabe |
|---|---|
| `workflow-guide-agent` | technologieunabhängiger Einstieg und Workflow-Hilfe |
| `workflow-syncer` | ausschließlich persistenten `.project/`-Zustand synchronisieren |
| `net-openagent` | .NET-Aufgaben klassifizieren und passende NET-Rolle empfehlen |
| `net-context-retriever` | unbekanntes .NET-Repository analysieren |
| `net-spec-writer` | Was/Warum und Spec→Plan für größere .NET-Änderungen vorbereiten |
| `net-plan-writer` | .NET-Arbeit in kleine Steps strukturieren |
| `net-coder` | klar abgegrenzte .NET-Änderung umsetzen |
| `net-reviewer` | .NET-Code/Architektur/Risiken read-only prüfen |
| `net-documentation` | technische .NET-Erstdokumentation erstellen |
| `net-doc-syncer` | .NET-Doku nach akzeptierten Änderungen synchronisieren |
| `net-editor` | technische Texte sprachlich überarbeiten |
| `net-toolsmith` | kleine deterministische .NET-Hilfswerkzeuge entwerfen |
| `cpp-context-retriever` | C++-Repository, Buildsystem und Toolchain analysieren |
| `cpp-coder` | kleine freigegebene C++-Änderungen umsetzen |
| `cpp-reviewer` | C++-Diff, Ownership/RAII und API-/ABI-Risiken prüfen |

Agenten sind Rollen, keine autonome Arbeitskette.

---

## 18. Wann brauche ich einen Skill?

Skills liefern wiederverwendbare Regeln und Fachwissen. Sie sind **keine Commands**.

| Skill | Wann relevant? |
|---|---|
| `change-governance` | vor Änderungen, Refactoring oder Doku-Synchronisation |
| `context-control` | wenn Repository oder Aufgabe zu groß für einen sinnvollen Gesamtkontext wird |
| `work-checkpoint` | bei längeren Arbeiten mit mehreren Einheiten |
| `resume-work` | nach Context-Reset, Modellwechsel oder neuer Session |
| `architecture-knowledge` | beim Ableiten und Dokumentieren von Architekturwissen |
| `workflow-guide` | für Hilfe aus der Repository-Dokumentation zum Workflow |
| `project-context` | wenn stabiler Projektkontext gezielt gelesen oder gepflegt werden soll |
| `small-step-workflow` | wenn exakt ein kleiner Step abgegrenzt werden muss |
| `git-checkpoint` | vor einem bewussten Benutzer-Commit zur Diff-/Scope-Prüfung |
| `code-review` | für allgemeine read-only Review-Regeln |

---

## 19. Wann ist ein Skript besser als das LLM?

Nutze Shell, PowerShell, Batch oder Python, wenn die Arbeit deterministisch ist und viel Context verbrauchen würde.

Typische Fälle:

- große Logs vorfiltern,
- Dateiinventar erzeugen,
- Daten in Chunks zerlegen,
- Werte zählen oder vergleichen,
- wiederholbare Transformationen,
- große Eingaben vorbereiten.

Grundidee:

```text
große Rohdaten
→ Skript
→ kleines relevantes Ergebnis
→ LLM bewertet das Ergebnis
```

Das spart Context und macht wiederkehrende Arbeit reproduzierbar.

---

## 20. Typische Situationen – Kurzantworten

### "Ich will nur zwei Zeilen ändern."

```text
/implement-change <Aufgabe>
```

Keine Spec nur um der Spec willen.

### "Die Aufgabe wird vermutlich mehrere Abende dauern."

Für eine größere .NET-Änderung:

```text
/create-spec-to-plan <Anforderung>
```

Spec und Plan getrennt freigeben. Danach:

```text
/work-start
```

Erst damit wird der bereits freigegebene Plan als Work-State aktiviert.

### "Ich weiß, was fachlich passieren soll, aber noch nicht wie."

```text
/create-spec-to-plan <Anforderung>
```

Spec prüfen und freigeben, danach Plan prüfen und freigeben.

### "OpenCode will schon mit dem nächsten Step anfangen."

Nicht freigeben. Die Step Boundary verlangt nach jedem abgeschlossenen Step `STOP`.

### "Der Agent behauptet, etwas sei aus historischen Gründen so gebaut."

Nach Quelle fragen. Ohne Quelle ist der Grund `unknown`.

### "Der Context ist voll."

```text
/context-compact
```

Danach neuer Context und:

```text
/work-continue
```

### "Ich habe vergessen, wo wir stehen."

```text
/work-status
```

### "Ich weiß nicht, welches Dokument zuständig ist."

Siehe [DATEI-REFERENZ.md](DATEI-REFERENZ.md) oder:

```text
/help-workflow Welche Datei ist für <Thema> zuständig?
```

---

## 21. Die tägliche Minimalroutine

Für die meisten Arbeiten reicht diese Denkfolge:

```text
1. Ist die Aufgabe klein?
   Ja → /implement-change
   Nein → persistenten Workflow verwenden

2. Brauche ich für die größere .NET-Änderung eine persistente Spec + Plan?
   Ja → /create-spec-to-plan <Anforderung>

3. Spec und Plan jeweils separat prüfen und freigeben

4. Für .NET genau einen Step starten: `/next-step T-xxx`.

5. Ergebnis verifizieren.

6. /complete-step T-xxx

7. Ergebnis lesen.

8. STOP.

9. Erst danach über den nächsten Step entscheiden.
```

---

## 22. Wo finde ich mehr Details?

| Frage | Dokument |
|---|---|
| Welche Datei macht was? | [DATEI-REFERENZ.md](DATEI-REFERENZ.md) |
| Schnellstart | [QUICKSTART.md](QUICKSTART.md) |
| vollständiger Workflow | [WORKFLOW.md](WORKFLOW.md) |
| Context-Reset | [CONTEXT-RESET.md](CONTEXT-RESET.md) |
| Checkpoints | [WORKFLOW-CHECKPOINTS.md](WORKFLOW-CHECKPOINTS.md) |
| Agenten | [AGENTEN-PLAN.md](AGENTEN-PLAN.md) |
| Skills | [SKILLS.md](SKILLS.md) |
| Permissions | [PermissionTools.md](PermissionTools.md) |
| häufige Fragen | [FAQ.md](FAQ.md) |

Für die laufende Arbeit ist dieses Benutzerhandbuch die erste Referenz. Für technische Details folgt danach die jeweilige Spezialdokumentation.
