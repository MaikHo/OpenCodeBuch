# OpenCode-Konfigurationsbeispiele

Die beiden Dateien sind **vollständige Projektbeispiele** für den mitgelieferten Workflow:

- `opencode.ollama.example.json` – Ollama + Workflow-Permissions + `workflow-guide-agent` als Default.
- `opencode.lmstudio.example.json` – LM Studio + Workflow-Permissions + `workflow-guide-agent` als Default.

## Verwendung

Kopiere die passende Datei in den **Projektroot** und nenne sie `opencode.json`:

```bash
cp Template/config/opencode.ollama.example.json opencode.json
```

oder:

```bash
cp Template/config/opencode.lmstudio.example.json opencode.json
```

Danach mindestens `MODEL-ID` an die tatsächlich bereitgestellte Modell-ID anpassen. Bei abweichendem Host oder Port zusätzlich `options.baseURL` ändern.

OpenCode erwartet die Modellangabe im Format `provider/model-id`. Deshalb steht im Beispiel zusätzlich:

```json
"model": "ollama/MODEL-ID"
```

bzw.:

```json
"model": "lmstudio/MODEL-ID"
```

`.opencode/opencode.example.json` enthält dieselben allgemeinen Workflow-Permissions **ohne Provider**. Diese Datei ist nur dann gedacht, wenn bereits eine eigene Provider-Konfiguration vorhanden ist und die Workflow-Einstellungen gezielt übernommen werden sollen.

## Cloud-Provider

Der Workflow ist nicht an Ollama oder LM Studio gebunden. Für einen Cloud-Provider kann `.opencode/opencode.example.json` als providerneutrale `opencode.json`-Basis verwendet werden. Danach den Anbieter über OpenCode `/connect` authentifizieren und das gewünschte Modell über `/models` auswählen.

Die Provider-Anmeldung und das Modell dürfen wechseln; Agenten, Commands, Skills und `.project/` bleiben davon unabhängig.
