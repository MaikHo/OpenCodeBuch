---
name: git-checkpoint
description: Nutzt Git-Diff und Status als kontrollierbaren Prüfpunkt zwischen KI-Arbeitsschritten, ohne Commit oder Push automatisch auszuführen
compatibility: opencode
metadata:
  workflow: software
  purpose: git-checkpoint
---

# Git als Kontrollpunkt

Nach einem freigegebenen Änderungsschritt:

1. `git status --short`
2. `git diff --check`
3. `git diff`
4. passende Verifikation oder Build
5. Ergebnis zusammenfassen
6. stoppen

Der Mensch entscheidet danach über den Commit.

## Warum?

Ein Git-Commit ist kein Ersatz für Review. Er ist eine nachvollziehbare Grenze zwischen zwei Arbeitsständen. Kleine Commits machen KI-Änderungen leichter prüfbar, rückverfolgbar und notfalls rückgängig.

## Grenzen

Nicht automatisch:
- `git commit`
- `git push`
- `git reset --hard`
- `git clean -fd`
- Force-Push
