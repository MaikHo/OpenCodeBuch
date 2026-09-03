---
description: Prüft den aktuellen Git-Zustand als Kontrollpunkt, ohne Commit oder Push
agent: workflow-guide-agent
---

Prüfe den aktuellen Git-Zustand als Kontrollpunkt.

Nutze nur lesende Git-Befehle wie `git status`, `git diff`, `git diff --check` und bei Bedarf `git log`.

Berichte:
1. Welche Dateien sind verändert?
2. Gehören alle Änderungen zum zuletzt freigegebenen Schritt?
3. Gibt es auffällige oder unbeabsichtigte Änderungen?
4. Ist der Schritt aus technischer Sicht bereit für einen manuellen Commit?

Erstelle keinen Commit.
Führe keinen Push aus.
Ändere keine Dateien.
