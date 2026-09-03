# Vollständiges Beispiel: große Dokumente vorverarbeiten

Dieses Beispiel stammt methodisch aus unserem früheren Skript-Workflow und zeigt, wie klassische Werkzeuge den LLM-Kontext klein halten können.

Die Idee:

```text
Quelldatei
→ deterministisch vorbereiten
→ Seiten extrahieren
→ Chunks erzeugen
→ immer nur einen Chunk an das Modell geben
→ bei Bedarf einzelne Seiten rendern/OCR
→ Ergebnisse zusammenführen
→ validieren
→ Original erst nach bewusster Freigabe archivieren
```

## Enthaltene Skripte

| Datei | Aufgabe |
|---|---|
| `check-tools.sh` | benötigte lokale Werkzeuge prüfen |
| `new-extraction.sh` | isoliertes Arbeitsverzeichnis anlegen |
| `prepare-presentation.sh` | PDF/PPTX vorbereiten und Seitentext extrahieren |
| `build-chunks.sh` | Seiten in kleine Markdown-Chunks zerlegen |
| `render-page.sh` | einzelne Seite bei Bedarf als Bild rendern |
| `ocr-page.sh` | einzelne gerenderte Seite gezielt per OCR auslesen |
| `validate-result.sh` | erzeugtes Ergebnis formal prüfen |
| `archive-source.sh` | Quelle erst am Ende bewusst archivieren |

Die Skripte sind ein Praxisbeispiel, keine zwingende Abhängigkeit des Haupt-Templates.
