---
description: Analysiert UI-, Binding-, State-, ReactiveUI- und Datenflussprobleme in .NET-Anwendungen.
agent: net-reviewer
---

# bug-dataflow

Analysiere einen konkreten Fehler im Datenfluss.

Fokus:

- UI aktualisiert ständig neu
- Datenbank wird mehrfach abgefragt
- Werte springen zurück
- Listen duplizieren Einträge
- ViewModel lädt endlos
- Commands feuern mehrfach
- ReactiveUI-Subscriptions laufen mehrfach
- Binding erzeugt Feedback-Schleifen

Dieser Command ist zunächst ein reiner Analyse-Command.
Es werden keine Dateien geändert.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Verbindliche Regeln

1. Analysiere komponentenweise und minimal-invasiv.
2. Starte bei beobachtbaren Symptomen.
3. Nimm keine globalen Ursachen an, solange der lokale Datenfluss nicht geprüft ist.
4. Prüfe zuerst View, ViewModel, State, Commands, Subscriptions und Datenzugriff im betroffenen Scope.
5. Führe keine Schreiboperationen aus.
6. Gib Fix-Vorschläge getrennt von der Analyse aus.

---

## Pflichtkontext

!`pwd`
!`cat AGENTS.md 2>/dev/null || true`

---

## Scope

Benutzereingabe:

```text
$ARGUMENTS
```

Wenn `$ARGUMENTS` leer ist, frage genau diese Punkte ab und stoppe danach:

1. Welche View, welches ViewModel oder welcher Ablauf ist betroffen?
2. Was ist das sichtbare Symptom?
3. Wann tritt es auf?
4. Welche Ressource wiederholt sich?
5. Welche Dateien sind wahrscheinlich beteiligt?

Wenn `$ARGUMENTS` Dateien, Klassen, Views, ViewModels, Routen oder Repositorys enthält, analysiere zuerst nur diesen Scope.

---

## Analysepfad

Prüfe in dieser Reihenfolge:

1. Einstiegspunkt des Symptoms
2. View / Binding / Event / Command
3. ViewModel-State
4. ReactiveUI `WhenAnyValue`, `Subscribe`, `ObservableAsPropertyHelper`, `ReactiveCommand`
5. Lifecycle wie `OnActivated`, Navigation, Loaded-Events, Timer
6. Collection-Updates und PropertyChanged-Ketten
7. Datenzugriff, Reloads, Caching, Repository-Aufrufe
8. Dispose / CompositeDisposable / Subscription-Lebensdauer
9. Nebenläufigkeit, Reentrancy, fehlende Guards
10. Minimaler Fix-Punkt

---

## Typische Fehlerquellen

Achte besonders auf:

- `LoadAsync()` in Property-Setter oder PropertyChanged-Ketten
- mehrfach registrierte Subscriptions
- fehlendes `DisposeWith(...)`
- fehlendes `DistinctUntilChanged()`
- fehlendes `Throttle()` bei Such-/Filtereingaben
- `ObservableCollection`-Updates während UI-Binding läuft
- Command ohne `IsExecuting`-/CanExecute-Schutz
- DB-Reload bei jeder Selektion
- ViewModel-Neuerzeugung durch Navigation
- State wird aus UI und Repository gleichzeitig geändert

---

## Ausgabeformat

```md
# Dataflow-Bug-Analyse

## Symptom

## Betroffener Scope

## Datenfluss

## Wahrscheinlichste Ursachen

| Wahrscheinlichkeit | Ursache | Beleg | Risiko |
|---|---|---|---|

## Minimaler Fix-Vorschlag

## Alternative Fixes

## Was zuerst geprüft werden sollte

## Offene Fragen
```

Keine Änderung ohne ausdrückliche Freigabe.
