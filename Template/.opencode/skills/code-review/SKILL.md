---
name: code-review
description: Prüft Code systematisch auf konkrete Fehler, Wartbarkeit, Nachvollziehbarkeit, Robustheit und unnötige Komplexität, ohne Änderungen vorzunehmen.
compatibility: opencode
metadata:
  workflow: review
---

# Code Review

## Ziel

Prüfe den angeforderten Code so, dass echte technische Probleme klar von optionalen Verbesserungen getrennt werden.

## Regeln

- Ändere keinen Code.
- Nenne Fehler und Risiken zuerst.
- Begründe jede Aussage technisch.
- Unterscheide zwischen:
  1. Fehler
  2. Risiko
  3. Verbesserung
  4. Stilfrage
- Bevorzuge KISS.
- Schlage höchstens drei Alternativen vor.
- Fordere keine Architekturänderung, wenn das konkrete Problem lokal lösbar ist.
- Berücksichtige vorhandene Verifikationen und erkennbare Projektentscheidungen.
