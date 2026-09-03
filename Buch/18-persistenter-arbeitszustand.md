# 18. Persistenter Arbeitszustand

Längere Arbeit braucht einen Zustand außerhalb des Chats.

Das Template trennt dabei bewusst mehrere Verantwortlichkeiten.

## Source of Truth

| Information | Führende Quelle |
|---|---|
| Inhalt und Status eines Steps | aktiver Plan |
| aktueller Work-State | `.project/work/current.yaml` |
| kleiner Überblick | `.project/activeContext.md` |
| Übergabe an eine neue Session | `.project/work/RESUME.md` |
| abgeschlossener Step-Zustand | Checkpoint |
| langfristige Änderungshistorie | `.project/CHANGELOG.md` |
| tatsächliche Dateiänderungen | Git-Diff |

Das ist wichtig, weil sonst drei Dateien drei unterschiedliche „Wahrheiten“ erzählen könnten.

## `current.yaml`

Diese Datei ist der maschinenlesbare Arbeitszustand.

Beispiel:

```yaml
status: in_progress
active_spec: ".project/specs/active/0012-import.md"
active_plan: ".project/plans/active/0012-import.plan.md"
current_step: "T-003"
next_step: "T-003"
verification:
  status: "not_run"
  method: "dotnet build"
  result: ""
  evidence: ""
  verified_at: ""
```

`next_step` bedeutet dabei ausdrücklich nicht „freigegeben“.

## `activeContext.md`

Das ist das kleine Dashboard für Mensch und Modell.

Es wird aus dem eigentlichen Zustand abgeleitet und bewusst klein gehalten.

## `RESUME.md`

Diese Datei ist für die Wiederaufnahme gedacht.

Wenn die Session endet oder der Context bewusst gewechselt wird, muss die nächste Session nicht den alten Chat kennen. Sie bekommt eine kurze Übergabe und kann die führenden Dateien erneut lesen.

## Checkpoints

Ein Checkpoint beschreibt einen wirklich abgeschlossenen Arbeitsschritt.

Er enthält beispielsweise:

```text
Step-ID
Ergebnis
betroffene Dateien
Verifikation
offene Risiken
nächster möglicher Schritt
```

Er ist kein Ersatz für Git, sondern ergänzt Git um den fachlichen Arbeitszustand.
