# Persistenter Arbeitszustand

Dieser Ordner macht längere OpenCode-Aufgaben unabhängig vom Modellkontext.

## Dateien

- `current.yaml` – führender, kompakter Work-State
- `RESUME.md` – abgeleitete Übergabe für die nächste Session
- `checkpoints/` – abgeschlossene Arbeitseinheiten
- `history/` – optionale Abschlusszusammenfassungen längerer Arbeiten

## Grundregel

```text
Modellkontext = temporär
aktiver Plan = Wahrheit über Step-Inhalt und Verify/Verified
current.yaml = Wahrheit über Work-State
Git-Diff = Wahrheit über Dateiänderungen
```

`RESUME.md` ist nur eine kompakte Ableitung. Bei Widerspruch gilt die führende Quelle.

## Freigabe

`next_step` und ein Resume-Eintrag zeigen nur, was als Nächstes sinnvoll wäre. Sie sind niemals eine implizite Benutzerfreigabe.
