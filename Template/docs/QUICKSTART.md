# Quickstart – OpenCode Workflow Template

Für das tägliche Nachschlagen siehe [BENUTZERHANDBUCH.md](BENUTZERHANDBUCH.md). Die vollständige Zuständigkeitsmatrix steht in [DATEI-REFERENZ.md](DATEI-REFERENZ.md).

## 1. Template übernehmen

Übernimm die Workflow-Dateien aus `Template/` in dein Projektrepository. In einem bestehenden Repository vorhandene `README.md`, `.gitignore` und `AGENTS.md` nicht blind überschreiben, sondern bewusst zusammenführen. Passe danach zuerst an:

```text
AGENTS.md
.project/projekt.md
.project/architecture.md
.project/tech.md
.project/entscheidungen.md
```

Unbekannte Informationen bleiben unbekannt. Keine Gründe erfinden.

## 2. `opencode.json` vorbereiten

Wähle unter `config/` das passende vollständige Beispiel und kopiere es als `opencode.json` in den Projektroot.

Ollama:

```bash
cp config/opencode.ollama.example.json opencode.json
```

LM Studio:

```bash
cp config/opencode.lmstudio.example.json opencode.json
```

Danach mindestens `MODEL-ID` ersetzen; bei Bedarf Host und Port anpassen. Die lokalen Beispiele enthalten bereits:

- Provider,
- Standardmodell im Format `provider/model-id`,
- `workflow-guide-agent` als Default-Agent,
- die allgemeinen Workflow-Permissions.

Für einen Cloud-Provider kann stattdessen `.opencode/opencode.example.json` als providerneutrale Basis verwendet werden. Danach OpenCode starten, den Anbieter mit `/connect` verbinden und das gewünschte Modell über `/models` auswählen.

## 3. OpenCode starten

OpenCode im Projektroot starten. Bei Unsicherheit:

```text
/help-workflow Was ist für meine Aufgabe der richtige Einstieg?
```

Der Default-Agent `workflow-guide-agent` ist technologieunabhängig und empfiehlt bei Bedarf `net-*`, `cpp-*` oder `workflow-syncer`.

## 4. Häufige Einstiege

| Ich möchte ... | Command / Agent |
|---|---|
| Workflow-Hilfe | `/help-workflow` |
| kleine .NET-Änderung | `/implement-change <Aufgabe>` |
| .NET-Repository verstehen | `/repo-inventory` |
| C++-Repository verstehen | Agent `cpp-context-retriever` |
| kleine C++-Änderung | Agent `cpp-coder` |
| größere .NET-Änderung spezifizieren und planen | `/create-spec-to-plan <Anforderung>` |
| freigegebenen Plan aktivieren | `/work-start` |
| aktuellen Stand sehen | `/work-status` |
| nach neuer Session fortsetzen | `/work-continue` |
| vor Context-Wechsel kompaktieren | `/context-compact` |
| fertigen Step abschließen | `/complete-step T-xxx` |
| längere Arbeit abschließen | `/work-finish` |

## 5. Größere .NET-Änderung

```text
/create-spec-to-plan <Anforderung>
```

Ablauf:

```text
Spec-Vorschlag
→ "Spec übernehmen"
→ persistente Spec im Backlog
→ Plan-Vorschlag
→ "Plan übernehmen"
→ Spec wechselt nach active + Plan wird aktiv
→ STOP
```

Danach:

```text
/work-start
```

`/work-start` aktiviert nur den Work-State. Der erste Step wird **nicht** automatisch ausgeführt.

Wenn du den aktuellen beziehungsweise nächsten Step nicht mehr im Kopf hast, frage zuerst den persistenten Zustand ab:

```text
/work-status
```

Beispielausgabe:

```text
Aktueller / nächster Step: T-001
```

Für .NET gibst du genau diesen Step bewusst frei und startest ihn:

```text
/next-step T-001
```

`/next-step` ohne Step-ID startet keinen Step. Ein in `.project/work/current.yaml` gespeicherter `next_step` ist nur Zustand und keine Freigabe.

Für C++ den Agenten `cpp-coder` bewusst wählen und genau `T-001` freigeben.

Nach realer Verifikation wird derselbe Step abgeschlossen:

```text
/complete-step T-001
```

Danach **STOP**. `T-002` benötigt eine neue Freigabe.

## 6. Verify / Verified

Ein Step enthält:

```text
Do:
Verify:
Verified: NOT RUN
```

`Verify` kann z. B. Build/Compiler, Linter, statische Analyse, Skript, Diff oder manuelle Prüfung sein. `Verified` darf nur das tatsächlich ausgeführte oder bestätigte Ergebnis enthalten.

## 7. Neue Session / Context-Reset

Vor dem Wechsel:

```text
/context-compact
```

Neue Session:

```text
/work-continue
```

`/work-continue` zeigt den nächsten möglichen Step, beginnt ihn aber nicht.

## 8. `.project/` verstehen

Die Kurzform:

```text
aktiver Plan     = Wahrheit über Step + Verify/Verified
current.yaml     = Wahrheit über Work-State
activeContext.md = kleines Dashboard
RESUME.md        = Übergabe
Git-Diff         = Wahrheit über Dateiänderungen
```

Details: [../.project/README.md](../.project/README.md)

## 9. Plattformhinweis

Die Workflow-Dateien selbst sind plattformunabhängig. Einige Commands verwenden zur Kontextgewinnung jedoch POSIX-Shell-Befehle. Diese sind für Linux, macOS oder WSL gedacht. Unter nativem Windows müssen solche Command-Blöcke auf PowerShell angepasst werden. Die Hilfsskripte unter `scripts/` liegen zusätzlich als PowerShell-/Batch-Varianten vor.
