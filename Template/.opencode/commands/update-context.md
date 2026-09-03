---
description: Prüft dauerhafte Projektinformationen und synchronisiert sie erst nach expliziter Freigabe unter .project/.
agent: workflow-syncer
---

# update-context

Prüfe die zuletzt entstandenen Erkenntnisse und Entscheidungen.

1. Schlage nur Informationen vor, die in zukünftigen Sessions noch relevant sind.
2. Ordne jeden Vorschlag einer passenden Datei unter `.project/` zu.
3. Trenne `observed`, `decided`, `unknown` und `conflict` mit `architecture-knowledge`.
4. Zeige den Vorschlag zuerst, ohne Dateien zu ändern.
5. **STOP** und warte auf `Übernehmen`.
6. Nach Freigabe ändere ausschließlich die ausdrücklich bestätigten `.project/`-Einträge.

Nicht speichern:
- Chatverläufe,
- temporäre Debug-Ausgaben,
- Vermutungen als Fakten,
- triviale Informationen, die direkt aus Code ersichtlich sind.
