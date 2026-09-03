# Aufgabe: Präsentation vollständig extrahieren

Bearbeite die vom Nutzer genannte Datei aus `input/` gemäß `AGENTS.md` und `docs/extraction-standard.md`.

## Verbindlicher Ablauf

1. Keine Subagenten starten.
2. Vorhandenen Job unter `temp/` verwenden oder mit `scripts/prepare-presentation.sh` erzeugen.
3. Chunks mit `scripts/build-chunks.sh` erzeugen, falls noch nicht vorhanden.
4. Chunks in numerischer Reihenfolge bearbeiten.
5. Immer nur **einen** Chunk gleichzeitig.
6. Ergebnis jedes Chunks unter `temp/<job>/result/chunk-NNN.md` speichern.
7. Für offensichtlich unvollständige Bild-/Tabellen-/Diagrammfolien Render/OCR verwenden.
8. Erst nach dem letzten Chunk finalisieren.
9. Nicht committen, nicht pushen und die Originaldatei nicht automatisch archivieren.

## Ergebnis pro Chunk

Der Chunk muss ausschließlich die fertige Folie-für-Folie-Dokumentation enthalten, z. B.:

```markdown
**Folie 11 — Mutterlinien**

- Zwei reine Ausgangslinien werden gekreuzt ...
- ...
```

Keine Meta-Erklärungen zwischen den Folien.

## Abschluss

Nach allen Chunks `prompts/finalize_extraction.md` befolgen.
