---
description: Erstellt eine kompakte Bestandsaufnahme des aktuellen Repositorys ohne Änderungen.
agent: net-context-retriever
---

# repo-inventory

Erstelle eine fokussierte Bestandsaufnahme des aktuellen Repositorys.

Dieser Command ist ein reiner Analyse-Command.
Es werden keine Dateien erstellt, geändert, gelöscht oder verschoben.

Dieser Command lädt **nicht den gesamten `.project/`-Ordner**. Prüfe jedoch `.project/work/current.yaml`, falls vorhanden. Wenn dort eine aktive längere Arbeit läuft und der Auftrag denselben Scope betrifft, stoppe und empfehle `/work-continue`, damit kein paralleler konkurrierender Arbeitszustand entsteht.

---

## Verbindliche Regeln

1. Lies vorhandene Projektregeln zuerst.
2. Triff keine kritischen Annahmen.
3. Kennzeichne unsichere Erkenntnisse als Vermutung.
4. Führe keine Schreiboperationen aus.
5. Gib eine kompakte, nachvollziehbare Übersicht aus.

---

## Pflichtkontext

Prüfe zuerst vorhandene Regel- und Einstiegsdateien:

!`pwd`
!`find . -maxdepth 2 -type f \( -name 'AGENTS.md' -o -name 'README.md' -o -name 'opencode.json' -o -name '*.sln' -o -name '*.csproj' -o -name 'Directory.Build.props' -o -name 'Directory.Packages.props' -o -name 'global.json' -o -name 'docker-compose.yml' -o -name 'compose.yml' \) -print | sort`
!`cat AGENTS.md 2>/dev/null || true`

---

## Analyseumfang

Analysiere bevorzugt:

- Repository-Struktur
- vorhandene Solutions und Projekte
- erkannte Technologien und Frameworks
- wichtige Einstiegspunkte
- Build- und Verifikationshinweise
- Abhängigkeiten und zentrale Packages
- erkennbare Architekturgrenzen
- auffällige Risiken
- sinnvolle nächste Analysepunkte

Nutze bei Bedarf weitere lesende Shell-Kommandos wie `find`, `rg`, `cat`, `sed` oder `head`.

---

## Ausgabeformat

Gib das Ergebnis in dieser Struktur aus:

```md
# Repository-Inventar

## Kurzfazit

## Erkannter Projekttyp

## Wichtige Dateien und Ordner

## Solutions und Projekte

## Technologie-Stack

## Build und Verifikation

## Architekturhinweise

## Risiken / Auffälligkeiten

## Nächste sinnvolle Schritte
```

Bleibe konkret. Keine allgemeinen Lehrbuchtexte.
