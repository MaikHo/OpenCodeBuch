# Aufgabe: Extraktion finalisieren

Finalisiere einen vollständig abgearbeiteten Job.

## Voraussetzungen

- alle Chunks aus `temp/<job>/chunks/` besitzen ein Ergebnis unter `temp/<job>/result/`,
- keine Chunk-Verarbeitung läuft mehr,
- die erwartete Gesamtfolienzahl ist bekannt.

## Schritte

1. Alle Chunk-Ergebnisse numerisch zusammenführen.
2. Prüfen, dass Folie 1 bis n vollständig abgedeckt ist.
3. Wiederholungen und Querverweise zu bestehenden Wissenseinträgen prüfen.
4. Nächste freie Wissens-ID ermitteln, ohne bestehende Einträge umzunummerieren.
5. Ordner `knowledge/<NNN>-<slug>/` aus den Vorlagen erzeugen.
6. Vollständigen Folieninhalt nach `slides.md` übernehmen.
7. Fachliche Übersicht nach `README.md` schreiben.
8. `metadata.yaml` und `sources.md` vervollständigen.
9. `knowledge/README.md` erst nach erfolgreicher Validierung aktualisieren.
10. `scripts/validate-result.sh` ausführen.

## Nicht durchführen

- Originaldatei nicht automatisch archivieren.
- Kein Commit.
- Kein Push.
- Keine Subagenten.
