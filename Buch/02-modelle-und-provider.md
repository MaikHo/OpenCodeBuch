# 2. Modelle und Provider: lokal oder Cloud

Der Workflow ist nicht an ein bestimmtes Modell gebunden.

OpenCode kann lokale Modelle verwenden, aber genauso Cloud-Anbieter. Das ist wichtig, weil das passende Modell von der Aufgabe und von der Umgebung abhängt.

## Meine bevorzugte lokale Variante

Ich arbeite gern mit **Qwen3.8:27b** und habe dem Modell bei mir bewusst nur **64k Context** zugewiesen.

Das ist meine Konfiguration und keine Vorgabe für das Template.

Warum nicht einfach das größtmögliche Context-Fenster einstellen? Weil mein Workflow darauf ausgelegt ist, Context gar nicht erst unnötig groß werden zu lassen. Projektwissen liegt im Repository, Skills werden bei Bedarf geladen, große Daten werden vorverarbeitet und Arbeiten werden in kleine Steps geteilt.

Damit ist die Frage für mich weniger:

```text
Wie voll darf das Context-Fenster werden?
```

sondern eher:

```text
Warum sollte ich diese Information überhaupt jetzt in den Context laden?
```

## Ollama

Ollama ist für mich besonders praktisch, wenn Modelle reproduzierbar lokal oder auf einem eigenen Server bereitgestellt werden sollen.

Ein typischer lokaler Endpunkt ist:

```text
http://localhost:11434/v1
```

OpenCode kann Ollama über dessen OpenAI-kompatiblen Endpunkt anbinden.

## LM Studio

LM Studio ist gerade auf einem Arbeitsplatzrechner bequem, wenn Modelle grafisch geladen, ausprobiert und als lokaler API-Server bereitgestellt werden sollen.

Ein typischer Endpunkt ist:

```text
http://127.0.0.1:1234/v1
```

Auch hier spricht OpenCode anschließend mit einer OpenAI-kompatiblen API.

## Cloud-Anbieter

Lokal ist für mich eine bevorzugte Betriebsart, aber kein Glaubenssatz.

OpenCode unterstützt viele Provider. Dazu gehören auch OpenAI und damit Codex-/OpenAI-Modelle. Die Verbindung wird in OpenCode typischerweise über:

```text
/connect
```

angelegt. Danach können verfügbare Modelle über:

```text
/models
```

ausgewählt werden.

Bei OpenAI kann OpenCode aktuell entweder über ChatGPT Plus/Pro oder über einen API-Key authentifiziert werden.

Das heißt: Derselbe Projektworkflow kann mit einem lokalen Qwen beginnen und später mit einem Cloud-Modell weitergeführt werden. Der Arbeitszustand bleibt trotzdem im Repository.

Genau deshalb möchte ich möglichst wenig modellabhängiges Wissen in Prompts verstecken.

## Was ist nun richtig?

Es gibt nicht die eine Antwort.

Ich würde nach diesen Fragen entscheiden:

- Dürfen die Projektdaten die eigene Umgebung verlassen?
- Reicht die lokale Hardware für das gewünschte Modell?
- Wie wichtig sind Geschwindigkeit und Tool-Calling-Qualität?
- Soll unabhängig von einem Cloud-Dienst gearbeitet werden?
- Ist für eine schwierige Aufgabe ein stärkeres Cloud-Modell sinnvoll?

Der Workflow bleibt dabei derselbe.
