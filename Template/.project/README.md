# `.project/` – persistenter Projekt- und Arbeitskontext

Dieser Ordner ist die dauerhafte Wissens- und Workflow-Schicht des Templates. Der Chatverlauf ist **keine** führende Quelle.

## Source of Truth

| Information | Führende Quelle | Rolle |
|---|---|---|
| Projektziel und Rahmen | `projekt.md` | langlebiger Projektkontext |
| Architekturdetails | `architecture.md` | ausführliche Architektur-Dokumentation |
| kompakte Architekturnavigation | `context/architecture-fingerprint.yaml` | kleine Orientierung für Agenten |
| dokumentierte Entscheidungen | `entscheidungen.md` | bekannte Gründe/Entscheidungen |
| aktueller Work-State | `work/current.yaml` | maschinenlesbarer Zustand |
| Inhalt und Status eines Steps | aktiver Plan unter `plans/active/` | führend für `Do`, `Verify`, `Verified` |
| aktueller Überblick | `activeContext.md` | abgeleitetes Dashboard, nicht führend |
| Wiederaufnahme | `work/RESUME.md` | abgeleitete Session-Übergabe |
| abgeschlossene Arbeitseinheit | `work/checkpoints/` | unveränderliche Zusammenfassung des Abschlussstands |
| langfristige abgeschlossene Änderungen | `CHANGELOG.md` | Historie verifizierter Steps |
| tatsächliche Dateiänderungen | Git-Diff | technische Wahrheit über Dateien |

## Konfliktregel

Wenn zwei Zustandsdateien widersprechen:

1. nicht raten,
2. führende Quelle aus der Tabelle bestimmen,
3. Git-Diff prüfen, wenn Dateiänderungen betroffen sind,
4. Konflikt melden,
5. abgeleitete Dateien erst nach Freigabe synchronisieren.

## Lebenszyklus einer größeren Änderung

```text
Anforderung
  ↓
/create-spec-to-plan <Anforderung>
  ↓
Spec: backlog → active
Plan: plans/active
  ↓
/work-start
  ↓
Benutzer gibt genau einen Step frei
  ↓
Implementierung
  ↓
Verify / Verified
  ↓
/complete-step T-xxx
  ↓
Plan → Checkpoint → current.yaml → activeContext → RESUME → CHANGELOG
  ↓
STOP
```

## Wichtige Regel

`next_step` bedeutet nur: **Dieser Step wäre als Nächstes logisch möglich.**

Es bedeutet niemals: **Dieser Step ist freigegeben.**
## Größenregel für `activeContext.md`

`activeContext.md` ist ein Dashboard, kein Log. Unter „Zuletzt geändert“ höchstens 5–6 aktuelle Punkte führen. Veraltete Punkte werden ersetzt statt dauerhaft angehängt.
