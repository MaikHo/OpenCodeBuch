# 9. Commands – die Bedienoberfläche

Commands sorgen dafür, dass ich wiederkehrende Abläufe nicht jedes Mal neu formulieren muss.

Sie liegen unter:

```text
.opencode/commands/
```

Das Template enthält aktuell diese Commands:

| Command | Aufgabe |
|---|---|
| `/help-workflow` | Bedienungsfrage zum Workflow beantworten |
| `/work-status` | aktuellen Arbeitszustand anzeigen |
| `/repo-inventory` | Repository grob inventarisieren |
| `/project-context` | relevanten Projektkontext ermitteln |
| `/analyze` | eine Aufgabe analysieren, ohne direkt zu ändern |
| `/structure-work` | eine größere Arbeit strukturieren |
| `/create-spec-to-plan` | größere .NET-Änderung als Spec und danach als Plan vorbereiten |
| `/work-start` | eine freigegebene geplante Arbeit aktivieren |
| `/next-step T-xxx` | genau einen .NET-Step ausdrücklich freigeben |
| `/complete-step T-xxx` | abgeschlossenen Step in `.project/` synchronisieren |
| `/work-continue` | vorhandenen Zustand rekonstruieren, aber nichts implizit freigeben |
| `/work-finish` | eine abgeschlossene Work-Session sauber beenden |
| `/context-compact` | Übergabe für einen Context-Wechsel vorbereiten |
| `/implement-change` | kleine .NET-Änderung ohne vollständigen Spec-/Plan-Ablauf bearbeiten |
| `/review-step` | einen Änderungsschritt prüfen |
| `/git-checkpoint` | Git-Diff und Umfang eines Steps prüfen |
| `/update-context` | stabilen Projektkontext gezielt aktualisieren |
| `/readme-draft` | README-Entwurf aus dem Repository erstellen |
| `/bug-dataflow` | Datenfluss eines Fehlers analysieren |
| `/review-dotnet` | .NET-spezifische Review-Unterstützung |

## Der wichtigste Bedienablauf

Vor einem Step kann ich zuerst nachsehen:

```text
/work-status
```

Beispielausgabe:

```text
Aktueller / nächster Step: T-003
```

Diesen Step gebe ich bewusst frei:

```text
/next-step T-003
```

Nach Umsetzung und Verifikation wird der persistente Zustand synchronisiert:

```text
/complete-step T-003
```

Wichtig:

```text
/next-step
```

ohne Step-ID startet keinen Step.

Ein in `current.yaml` gespeicherter `next_step` ist Arbeitszustand und keine Freigabe.

## Command ist nicht Agent

Ein Command beschreibt den Ablauf, ein Agent die Rolle, die ihn ausführt.

Dadurch kann beispielsweise ein schreibender Step mit `net-coder` laufen, während die Synchronisation von `.project/` durch `workflow-syncer` erfolgt.
