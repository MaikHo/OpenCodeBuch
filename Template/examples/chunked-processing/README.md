# Beispiel: große Eingaben kontrolliert verarbeiten

Dieses Mini-Beispiel zeigt das Muster aus Kapitel 30.

```text
input/
  ↓
scripts/prepare.sh
  ↓
work/chunks/
  ↓
immer genau einen Chunk mit dem LLM bearbeiten
  ↓
work/results/
  ↓
scripts/validate.sh
  ↓
output/final.md
```

Es ist absichtlich keine Präsentations- oder OCR-Lösung für ein bestimmtes Dateiformat. Das Beispiel zeigt nur die Architektur des Prozesses.

## Warum das so gebaut ist

- Dateiaufteilung ist deterministisch und gehört ins Skript.
- Das LLM sieht nur einen kleinen Ausschnitt.
- Zwischenergebnisse bleiben nach Context-Reset erhalten.
- Finalisierung erfolgt erst, wenn die erwarteten Teilergebnisse vorhanden sind.
