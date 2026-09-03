---
description: Erstellt einen README-Entwurf aus dem aktuellen Repository ohne Dateien zu ändern.
agent: net-documentation
---

# readme-draft

Erstelle einen sachlichen README-Entwurf für das aktuelle Repository.

Dieser Command schreibt keine Datei.
Der README-Inhalt wird nur als Markdown-Entwurf ausgegeben.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Verbindliche Regeln

1. Lies vorhandene Projektregeln zuerst.
2. Nutze vorhandene Dateien als Quelle.
3. Erfinde keine Features.
4. Markiere unklare Punkte sichtbar als offen.
5. Schreibe keine Datei.
6. Keine Marketing-Sprache.

---

## Pflichtkontext

!`pwd`
!`find . -maxdepth 3 -type f \( -name 'AGENTS.md' -o -name 'README.md' -o -name '*.sln' -o -name '*.csproj' -o -name 'Directory.Build.props' -o -name 'Directory.Packages.props' -o -name 'global.json' -o -name 'docker-compose.yml' -o -name 'compose.yml' \) -print | sort`
!`cat AGENTS.md 2>/dev/null || true`

---

## Zusatzauftrag

Benutzereingabe:

```text
$ARGUMENTS
```

Wenn `$ARGUMENTS` spezielle Zielgruppen oder Inhalte nennt, berücksichtige sie.
Beispiele:

- intern für Entwickler
- Setup-Anleitung
- kurze Projektübersicht
- Fokus auf Build/Verifikation
- Fokus auf Architektur

---

## Ausgabeformat

Gib ausschließlich einen verwendbaren Markdown-Entwurf aus:

```md
# Projektname

## Überblick

## Zweck

## Technologie-Stack

## Projektstruktur

## Voraussetzungen

## Setup

## Build

## Verifikation

## Verwendung

## Architekturhinweise

## Offene Punkte
```

Wenn Informationen fehlen, schreibe `TODO:` an die passende Stelle.
