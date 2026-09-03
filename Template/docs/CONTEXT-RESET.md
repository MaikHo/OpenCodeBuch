# Context-Reset und Fortsetzen

## Grundsatz

Nicht den Chat retten. Den Arbeitszustand retten.

## Vor einem Context-Reset

```text
/context-compact
```

Der Command liest nur:

1. `AGENTS.md`,
2. `activeContext.md`,
3. `current.yaml`,
4. aktiven Plan,
5. letzten Checkpoint,
6. nur zusätzlich nötige Dateien.

Er zeigt einen `RESUME.md`-Vorschlag und schreibt ihn erst nach `Übernehmen`.

## Neue Session

```text
/work-continue
```

Startreihenfolge:

```text
AGENTS.md
→ activeContext.md
→ current.yaml
→ aktiver Plan
→ letzter Checkpoint
→ RESUME.md
```

Danach wird der nächste mögliche Step angezeigt und **gestoppt**. Eine neue Benutzerfreigabe ist erforderlich.

## Was nicht gespeichert wird

- Chatverlauf,
- verworfene Gedanken,
- vollständige Tool-Ausgaben,
- große Codekopien,
- triviale Informationen, die aus dem Repository direkt ableitbar sind.

## Konflikte

Wenn Resume, Dashboard, Plan und Repository nicht zusammenpassen, gilt die Source-of-Truth-Hierarchie aus `.project/README.md`. Bei Dateiänderungen ist Git-Diff die technische Wahrheit. Nicht raten.
