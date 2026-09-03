---
description: Bereitet eine kleine, klar beschriebene Änderung vor und setzt sie erst nach ausdrücklicher Freigabe um.
agent: net-coder
---

# implement-change

Setze eine kleine, klar beschriebene Änderung kontrolliert um.

Dieser Command ist für kleine, abgegrenzte Änderungen gedacht.
Kein breites Refactoring.
Keine Architekturänderung nebenbei.
Keine stillen Zusatzänderungen.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Verbindliche Regeln

1. Lies vorhandene Projektregeln zuerst.
2. Arbeite nur im beschriebenen Scope.
3. Prüfe zuerst den relevanten Code.
4. Triff keine kritischen Annahmen.
5. Gib vor jeder Änderung einen kurzen Umsetzungsplan aus.
6. Führe Schreiboperationen erst nach exakt dieser Freigabe aus: `Übernehmen`
7. Nicht direkt auf `main` oder `master` arbeiten. Wenn der aktuelle Branch `main` oder `master` ist, warne und stoppe vor Änderungen.
8. Keine Lösch-, Reset- oder Force-Push-Aktionen.

---

## Pflichtkontext

!`pwd`
!`git branch --show-current 2>/dev/null || true`
!`cat AGENTS.md 2>/dev/null || true`

---

## Auftrag

```text
$ARGUMENTS
```

Wenn `$ARGUMENTS` leer ist, frage nur:

```text
Welche kleine Änderung soll umgesetzt werden?
```

Danach stoppen.

---

## Arbeitsablauf

### Schritt 1: Scope klären

- Was soll geändert werden?
- Welche Dateien oder Komponenten sind betroffen?
- Welche Dateien müssen gelesen werden?
- Welche Risiken gibt es?

### Schritt 2: Analyse

- Lies nur relevante Dateien.
- Erkläre den aktuellen Zustand kurz.
- Benenne Annahmen und offene Fragen.
- Wenn der Auftrag nicht eindeutig ist, frage nach.

### Schritt 3: Umsetzungsplan

Gib vor jeder Änderung aus:

```md
## Umsetzungsplan

1. ...
2. ...
3. ...

## Betroffene Dateien

- ...

## Risiken

- ...

Warte auf Freigabe: Übernehmen
```

### Schritt 4: Umsetzung

Erst wenn der Benutzer exakt `Übernehmen` schreibt:

- führe die minimale Änderung aus
- ändere nur die angekündigten Dateien
- vermeide Nebenänderungen
- halte Code einfach und überschaubar

### Schritt 5: Ergebnis

Nach der Umsetzung:

```md
## Geändert

- ...

## Verifikation / Prüfung

- ...

## Hinweise

- ...
```

Wenn keine Verifikation ausgeführt wurde, sage das explizit.
