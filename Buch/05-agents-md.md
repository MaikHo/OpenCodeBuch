# 5. AGENTS.md – die Spielregeln

`AGENTS.md` ist für mich die Verfassung des Projekts.

Sie soll wichtig sein, aber nicht groß.

## Was hinein gehört

Zum Beispiel:

```markdown
# Arbeitsweise

- Vor Änderungen zuerst bestehenden Code und Projektregeln prüfen.
- Funktionierenden Code nicht nur aus Stilgründen umbauen.
- Eine Freigabe gilt nur für den ausdrücklich genannten Arbeitsschritt.
- Nach einem abgeschlossenen Step nicht automatisch weitermachen.
- Destruktive Aktionen benötigen eine ausdrückliche Freigabe.
```

Das sind Regeln, die bei fast jeder Aufgabe gelten.

## Was nicht hinein gehört

Nicht hinein gehören zwanzig Seiten Architektur, alte Fehlerberichte, komplette Tasks oder jedes Detail einer laufenden Änderung.

Dafür gibt es `.project/`.

Wenn `AGENTS.md` zu groß wird, zahlen wir den Context-Preis bei jeder Session, obwohl ein Großteil der Informationen gerade gar nicht gebraucht wird.

## Regel oder Wissen?

Eine einfache Unterscheidung hilft:

```text
Wie soll gearbeitet werden?
→ AGENTS.md

Was wissen wir über dieses Projekt?
→ .project/
```

Damit bleibt `AGENTS.md` stabil und der Projektkontext kann unabhängig davon wachsen und gepflegt werden.
