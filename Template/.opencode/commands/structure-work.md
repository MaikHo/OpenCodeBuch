---
description: Strukturiert ein Feature, Problem oder eine Änderungsanforderung zu einem klaren Arbeitsplan.
agent: net-spec-writer
---

# structure-work

Strukturiere ein Feature, Problem oder eine technische Änderungsanforderung.

Dieser Command plant und strukturiert nur.
Es werden keine Dateien erstellt, geändert, gelöscht oder verschoben.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Ziel

Mache aus einer unscharfen Beschreibung eine klare, prüfbare Arbeitsgrundlage.

Geeignet für:

- neues Feature
- Bug oder Problem
- kleine technische Änderung
- Refactoring-Idee
- unklare Anforderung
- Vorbereitung für spätere Umsetzung

---

## Pflichtkontext

!`pwd`
!`cat AGENTS.md 2>/dev/null || true`

---

## Eingabe

```text
$ARGUMENTS
```

Wenn `$ARGUMENTS` leer ist, frage nur:

```text
Welches Feature, Problem oder welche Änderung soll strukturiert werden?
```

Danach stoppen.

---

## Analyse

Arbeite die Eingabe strukturiert auf:

1. Ziel verstehen
2. Problem oder Bedarf formulieren
3. Ist-Zustand und Soll-Zustand trennen
4. Scope und Nicht-Scope benennen
5. Annahmen sichtbar machen
6. Risiken und offene Fragen benennen
7. Akzeptanzkriterien formulieren
8. mögliche Arbeitsschritte ableiten
9. Verifikationspunkte vorschlagen

Wenn relevante Dateien genannt werden, lies sie.
Wenn keine Dateien genannt werden, nutze nur eine grobe Repo-Orientierung und frage bei Bedarf nach.

---

## Ausgabeformat

```md
# Strukturierte Arbeitsgrundlage

## Kurzbeschreibung

## Ziel

## Ist-Zustand

## Soll-Zustand

## Scope

## Nicht-Scope

## Annahmen

## Offene Fragen

## Risiken

## Akzeptanzkriterien

- [ ] ...

## Mögliche Arbeitsschritte

1. ...

## Verifikationspunkte

- ...
```

Bleibe konkret und umsetzbar.
