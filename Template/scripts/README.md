# Hilfsskripte

Diese Skripte zeigen das Prinzip: **mechanische Arbeit außerhalb des LLMs erledigen**.

## Shell

```bash
./scripts/sh/project_inventory.sh .
```

Erzeugt eine kleine Projektinventur mit Dateitypen und großen Dateien.

## PowerShell

```powershell
./scripts/powershell/Project-Inventory.ps1 .
```

Gleiche Idee für Windows/PowerShell.

## Python

```bash
python scripts/python/summarize_log.py application.log
```

Filtert typische Fehler-, Exception- und Warnungszeilen und gibt nur begrenzten Kontext zurück.

## Warum diese Skripte absichtlich simpel sind

Sie sollen leicht kontrollierbar sein. Ein Hilfsskript, das selbst wieder hunderte Zeilen Magie enthält, verschiebt das Problem nur.

## Batch

```bat
scripts\batch\project_inventory.bat .
```

Die Batch-Variante zählt bewusst nur die Dateien. Für komplexere Auswertungen ist PowerShell unter Windows übersichtlicher und wartbarer.

## Git-Checkpoint

Zusätzlich liegen lesende Git-Checkpoint-Skripte für Shell, PowerShell und Batch bei. Sie zeigen Status, prüfen den Diff und geben eine Diff-Statistik aus. Sie erstellen bewusst keinen Commit und führen keinen Push aus.

```text
scripts/sh/git_checkpoint.sh
scripts/powershell/Git-Checkpoint.ps1
scripts/batch/git_checkpoint.bat
```
