# 20. Vollständiger Arbeitsablauf

Nehmen wir eine größere Änderung in einem bestehenden .NET-Projekt.

## 1. Repository verstehen

Wenn das Repository unbekannt ist:

```text
/repo-inventory
```

Danach kann relevanter Projektkontext erzeugt oder aktualisiert werden:

```text
/project-context
```

## 2. Spec und Plan erstellen

```text
/create-spec-to-plan Verarbeitung großer Eingabedateien robuster machen
```

Der Command erzeugt zuerst einen Spec-Vorschlag.

Ich prüfe ihn.

Erst nach meiner Freigabe wird die Spec übernommen und daraus ein Plan erstellt.

Auch den Plan prüfe ich.

## 3. Arbeit starten

Nach freigegebenem Plan:

```text
/work-start
```

Dann:

```text
/work-status
```

Beispiel:

```text
Aktueller / nächster Step: T-001
```

## 4. Genau einen Step freigeben

```text
/next-step T-001
```

Damit ist genau T-001 freigegeben.

## 5. Ergebnis prüfen

Nach der Änderung wird die im Step definierte Verifikation durchgeführt.

Zusätzlich kann ich den Diff ansehen:

```text
/git-checkpoint
```

## 6. Step abschließen

Wenn der Step wirklich fertig ist:

```text
/complete-step T-001
```

Jetzt werden Plan, Checkpoint, Work-State, Active Context, Resume und ChangeLog synchronisiert.

Dann ist Schluss.

## 7. Nächsten Step bewusst starten

```text
/work-status
```

zeigt beispielsweise:

```text
Aktueller / nächster Step: T-002
```

Dann erst:

```text
/next-step T-002
```

## 8. Neue Session

Wenn später eine neue Session startet:

```text
/work-continue
```

rekonstruiert den vorhandenen Zustand und zeigt, wo weitergearbeitet werden kann.

Auch hier gilt: Ein rekonstruierter `next_step` ist keine automatische Freigabe.

## Was hier eigentlich passiert

Der Chat ist austauschbar.

Das Modell ist austauschbar.

Die Session ist austauschbar.

Der Arbeitszustand bleibt im Repository.

Genau das ist das Ziel.
