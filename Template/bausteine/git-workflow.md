# Git-Workflow mit kontrollierten KI-Schritten

## Vor einer Änderung

```bash
git status --short
```

## Nach genau einem freigegebenen Schritt

```bash
git status --short
git diff --check
git diff
```

Danach die für das Projekt vorgesehene technische Verifikation ausführen.

## Commit

Der Commit wird bewusst vom Menschen freigegeben und ausgeführt.

## Nicht automatisch ausführen

```text
git push
git push --force
git reset --hard
git clean -fd
```
