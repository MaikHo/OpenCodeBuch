# OpenCode Workflow Template

Dieser Ordner ist die praktisch verwendbare Umsetzung des im Buch beschriebenen kontrollierten Workflows.

## Schnellstart

1. Die Workflow-Dateien dieses Ordners in den Root des eigenen Projektrepositories übernehmen. Bei einem bestehenden Repository vorhandene `README.md`, `.gitignore` und `AGENTS.md` nicht blind überschreiben, sondern bewusst zusammenführen.
2. `AGENTS.md` und die `.project/`-Grundlagen an das echte Projekt anpassen. Unbekanntes bleibt unbekannt.
3. Passende OpenCode-Konfiguration aus `config/` als `opencode.json` in den Projektroot kopieren.
4. In `opencode.json` mindestens `MODEL-ID` und bei Bedarf Host/Port anpassen.
5. OpenCode im Projektroot starten.
6. Mit `/help-workflow` prüfen, ob der Projekt-Workflow geladen wurde.

Beispiel für Ollama:

```bash
cp config/opencode.ollama.example.json opencode.json
```

Danach `MODEL-ID` ersetzen und OpenCode starten.

> `opencode.json` ist absichtlich keine fertige Universaldatei. Modell und Provider müssen zum eigenen System passen. Die Dateien unter `config/` enthalten vollständige Beispiele für Ollama und LM Studio sowie den Default-Agenten und die Workflow-Permissions. Cloud-Provider können stattdessen über die normale OpenCode-Provider-Konfiguration bzw. `/connect` angebunden werden.

Wichtige Referenzen:

- [Benutzerhandbuch](docs/BENUTZERHANDBUCH.md)
- [Datei-Referenz](docs/DATEI-REFERENZ.md)
- [Quickstart](docs/QUICKSTART.md)
- [Workflow](docs/WORKFLOW.md)
- [.project-Vertrag](.project/README.md)

## Struktur

```text
Template/
├── AGENTS.md
├── .opencode/
│   ├── agents/
│   ├── commands/
│   └── skills/
├── .project/
│   ├── README.md
│   ├── activeContext.md
│   ├── context/
│   ├── specs/
│   ├── plans/
│   └── work/
├── docs/
├── scripts/
├── config/
├── bausteine/
└── examples/
```

## Agentenfamilien

Der **Workflow-Kern** ist technologieunabhängig:

- `workflow-guide-agent`
- `workflow-syncer`

Technologiespezifische Agenten sind am Namen erkennbar:

```text
net-*  → C#/.NET
cpp-*  → C++
```

Dadurch vermischt das Template allgemeine Governance nicht mit technologiespezifischen Coding-Regeln.

## Kleine Änderung

Für die mitgelieferte .NET-Variante:

```text
/implement-change <Aufgabe>
→ analysieren
→ Vorschlag
→ Freigabe
→ genau diese Änderung
→ verifizieren
→ Ergebnis
→ STOP
```

Für C++ kann direkt `cpp-coder` verwendet werden.

## Größere .NET-Änderung

```text
/create-spec-to-plan <Anforderung>
→ Spec-Vorschlag
→ Spec freigeben
→ Plan-Vorschlag
→ Plan freigeben
→ STOP
→ /work-start
→ /work-status zeigt aktuellen / nächsten Step
→ /next-step T-xxx gibt genau diesen .NET-Step bewusst frei
→ genau diesen Step implementieren
→ Verify / Verified
→ /complete-step T-xxx schließt genau diesen Step ab
→ Zustand synchronisieren
→ STOP
```

`/next-step` ohne Step-ID startet keinen Step. Ein in `.project/work/current.yaml` gespeicherter `next_step` ist nur Arbeitszustand und keine Freigabe. Der nächste Step beginnt niemals automatisch.

## `.project/`

`.project/README.md` definiert verbindlich, welche Datei für welchen Zustand führend ist. Besonders wichtig:

```text
aktiver Plan = Step-Inhalt und Verify/Verified
current.yaml = Work-State
activeContext.md = kleines Dashboard
RESUME.md = Übergabe
Git-Diff = tatsächliche Dateiänderungen
```

## Plattformhinweis

Das Template enthält Hilfsskripte für Shell, PowerShell, Batch und Python. Einige mitgelieferte OpenCode-Commands verwenden jedoch POSIX-Shell-Kommandos. Für diese Commands ist Linux, macOS oder WSL der erwartete Ausführungskontext. Unter nativem Windows müssen die betreffenden Shell-Kommandos projektspezifisch angepasst werden.

## Nicht enthalten

- kein autonomes Abarbeiten kompletter Pläne
- keine ungefragten Architekturumbauten
- keine firmenspezifischen Inhalte
- keine installierten `node_modules`

Verifikation bleibt projektspezifisch und kann über Build, Compiler/Linter, Skripte, Diff oder manuelle Prüfung erfolgen.
