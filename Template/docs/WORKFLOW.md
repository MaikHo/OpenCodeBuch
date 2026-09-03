# Arbeitsweise mit dem OpenCode-Template

## Grundidee

Das Template trennt kleine One-shot-Aufgaben von größeren persistenten Arbeiten. Der Repository-Zustand trägt die Arbeit über Sessions hinweg; der Chat ist nur temporärer Kontext.

## 1. Kleine Aufgabe

Für eine kleine .NET-Änderung:

```text
/implement-change <Aufgabe>
```

Klein bedeutet: überschaubarer Scope, kleiner Diff, keine neue Architekturentscheidung, kein erwarteter Context-Wechsel.

Für C++ kann direkt `cpp-coder` gewählt werden.

## 2. Größere Änderung: Spec → Plan

```text
/create-spec-to-plan <Anforderung>
```

Der Ablauf enthält zwei Stop-Punkte:

```text
Spec-Vorschlag
→ Benutzer prüft
→ Spec übernehmen
→ Plan-Vorschlag
→ Benutzer prüft
→ Plan übernehmen
→ STOP
```

Die Spec beschreibt **Was und Warum**. Der Plan beschreibt **Wie** in kleinen Steps. Planung autorisiert keine Implementierung.

## 3. Work-State aktivieren

```text
/work-start
```

`workflow-syncer` verbindet aktive Spec und aktiven Plan mit dem persistenten Work-State:

- `current.yaml`,
- `activeContext.md`,
- `RESUME.md`.

Der erste Step wird nur als nächster möglicher Step eingetragen. Er startet nicht automatisch.

## 4. Genau einen Step bearbeiten

Für .NET gibt der Benutzer exakt einen Step über den Command frei:

```text
/next-step T-003
```

Der Command wechselt auf `net-coder` und bearbeitet nur diesen Step. Für C++ wird `cpp-coder` bewusst ausgewählt und genau ein Step freigegeben.

Ein Step enthält im aktiven Plan:

```text
Do:
Verify:
Verified: NOT RUN
```

`Verified` wird erst nach realer Verifikation geändert.

## 5. Step abschließen

```text
/complete-step T-003
```

Synchronisationsreihenfolge:

```text
aktiver Plan
→ Checkpoint
→ current.yaml
→ activeContext.md
→ RESUME.md
→ CHANGELOG.md
→ STOP
```

Der nächste Step wird nicht begonnen.

## 6. Fortsetzen nach neuer Session

Vor Context-Wechsel:

```text
/context-compact
```

Neue Session:

```text
/work-continue
```

Der Command rekonstruiert den Zustand und zeigt nur den nächsten möglichen Step. Danach wartet er auf eine neue Freigabe.

## 7. Source of Truth

Siehe `.project/README.md`.

Kurz:

```text
aktiver Plan = Step-Inhalt + Verify/Verified
current.yaml = Work-State
activeContext.md = Dashboard
RESUME.md = Übergabe
Git-Diff = Dateiänderungen
```

## 8. Review

Review und Umsetzung bleiben getrennt. Für .NET steht `net-reviewer`, für C++ `cpp-reviewer` bereit. Reviewer ändern keine Dateien.

## 9. Abschluss

```text
/work-finish
```

Der Command prüft zuerst, ob offene Steps/Verifikationen/Risiken bestehen. Erst nach `Abschließen` synchronisiert `workflow-syncer` den Abschluss und archiviert Plan/Spec kontrolliert.

Commit und Push bleiben Benutzerentscheidungen.
