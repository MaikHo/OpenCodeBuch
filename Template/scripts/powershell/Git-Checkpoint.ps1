$ErrorActionPreference = "Stop"

Write-Host "== Git status =="
git status --short

Write-Host "`n== Diff check =="
git diff --check

Write-Host "`n== Diff stat =="
git diff --stat
