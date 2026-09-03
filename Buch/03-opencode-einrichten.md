# 3. OpenCode einrichten

OpenCode ist in diesem Aufbau die Schicht zwischen Modell und Repository.

Das Modell allein kennt weder unsere Commands noch Agenten, Skills oder Projektregeln. OpenCode stellt diese Werkzeuge bereit und steuert, welche Rolle welche Rechte bekommt.

## Provider verbinden

Für eingebaute Cloud-Anbieter ist der normale Einstieg:

```text
/connect
```

Danach lässt sich mit:

```text
/models
```

ein verfügbares Modell auswählen.

Für lokale OpenAI-kompatible Endpunkte wird der Provider zusätzlich in `opencode.json` beschrieben.

Das Template enthält dafür vollständige Beispiele:

```text
Template/config/opencode.ollama.example.json
Template/config/opencode.lmstudio.example.json
```

Diese Dateien sind absichtlich Beispiele. Modell-ID, Host und Port müssen zur eigenen Umgebung passen.

## Projektkonfiguration

Für den Workflow liegt die `opencode.json` im Projektroot.

Beispiel:

```text
mein-projekt/
├── opencode.json
├── AGENTS.md
├── .opencode/
└── .project/
```

So reist die Projektkonfiguration gemeinsam mit dem Repository.

Zugangsdaten gehören selbstverständlich nicht in das Repository.

## Erster Start

Nach der Konfiguration starte ich OpenCode im Projektroot.

Danach prüfe ich als Erstes nicht irgendeine Codeänderung, sondern ob der Workflow erreichbar ist:

```text
/help-workflow
```

oder:

```text
/work-status
```

Wenn Commands und Agenten erkannt werden, ist die technische Basis da.

## Warum nicht alles global konfigurieren?

Globale Einstellungen sind für persönliche Dinge sinnvoll.

Projektregeln, Projektagenten und Workflow-Dateien sollen dagegen im Repository liegen. Sonst funktioniert das Projekt nur auf dem Rechner, auf dem ich zufällig meine persönliche OpenCode-Konfiguration gepflegt habe.

Das wäre für Übergabe und Reproduzierbarkeit genau die falsche Richtung.
