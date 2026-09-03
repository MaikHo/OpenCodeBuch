---
description: Führt einen fokussierten Review für ein .NET-Repository oder einen angegebenen Scope aus.
agent: net-reviewer
---

# review-dotnet

Führe einen fokussierten technischen Review durch.

Dieser Command ist ein reiner Analyse- und Review-Command.
Es werden keine Dateien erstellt, geändert, gelöscht oder verschoben.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Verbindliche Regeln

1. Lies vorhandene Projektregeln zuerst.
2. Arbeite scope-basiert.
3. Prüfe zuerst beobachtbare Fakten aus Code und Projektdateien.
4. Trenne Befund, Risiko und Empfehlung klar.
5. Führe keine Schreiboperationen aus.
6. Bewerte Findings nach Priorität.

---

## Pflichtkontext

!`pwd`
!`find . -maxdepth 3 -type f \( -name 'AGENTS.md' -o -name '*.sln' -o -name '*.csproj' -o -name 'Directory.Build.props' -o -name 'Directory.Packages.props' -o -name 'global.json' \) -print | sort`
!`cat AGENTS.md 2>/dev/null || true`

---

## Scope

Benutzereingabe:

```text
$ARGUMENTS
```

Wenn `$ARGUMENTS` leer ist, reviewe das Repository grob.
Wenn `$ARGUMENTS` konkrete Dateien, Ordner, Projekte oder Themen enthält, reviewe zuerst nur diesen Scope.

---

## Prüfpunkte

Prüfe passend zum gefundenen Projekt:

- Architektur und Modulgrenzen
- Kopplung und Verantwortlichkeiten
- Nachvollziehbarkeit
- Fehlerbehandlung und Logging
- Async-/Await-Verwendung
- Dependency Injection und Lifetimes
- UI-/Businesslogik-Trennung
- AvaloniaUI / MVVM / ReactiveUI-Strukturen
- Blazor / Radzen-Strukturen
- Datenzugriff und Seiteneffekte
- Konfiguration und Secrets-Risiken
- veraltete Frameworks oder auffällige Paketversionen
- konkrete nächste Verbesserungen

---

## Ausgabeformat

```md
# .NET Review

## Kurzfazit

## Scope

## Stärken

## Findings

| Priorität | Bereich | Befund | Risiko | Empfehlung |
|---|---|---|---|---|

## Kritische Punkte

## Quick Wins

## Größere Refactorings

## Offene Fragen
```

Keine pauschalen Aussagen ohne Codebezug.
