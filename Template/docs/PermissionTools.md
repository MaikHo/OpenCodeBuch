# kollegentaugliche Übersicht der **OpenCode Permission-Tools**.

OpenCode steuert Tool-Zugriffe über `permission`. Pro Permission kann normalerweise `allow`, `ask` oder `deny` gesetzt werden. `ask` bedeutet: OpenCode fragt vor Ausführung nach; die UI bietet dann sinngemäß einmal erlauben, dauerhaft für passende Muster erlauben oder ablehnen. ([opencode.ai][1])

## Grundwerte

| Wert    | Bedeutung                       | Einsatz                                        |
| ------- | ------------------------------- | ---------------------------------------------- |
| `allow` | Tool darf ohne Rückfrage laufen | Nur bei ungefährlichen Lese-/Analyseaktionen   |
| `ask`   | Vor Ausführung wird gefragt     | Standard für Schreibzugriff, Shell, Webzugriff |
| `deny`  | Tool ist blockiert              | Für gefährliche oder nicht benötigte Aktionen  |

## Permission-Übersicht

| Permission           | Gesteuerte Tools                         | Wirkung                                                              | Risiko                                                   | Empfehlung                                |
| -------------------- | ---------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------ |
| `read`               | `read`                                   | Dateien lesen                                                        | Kann sensible Inhalte lesen                              | Meist `allow`, aber `.env` blockieren            |
| `edit`               | `edit`, `write`, `patch`           | Dateien ändern, neu schreiben oder patchen                           | Hoch: Code/Doku kann verändert oder überschrieben werden | `ask`                                            |
| `glob`               | `glob`                                   | Dateien per Muster finden, z. B. `**/*.csproj`                       | Niedrig                                                  | `allow`                                          |
| `grep`               | `grep`                                   | Inhalte per Suche/Regex finden                                       | Niedrig bis mittel, kann viele Treffer ausgeben          | `allow`                                          |
| `bash`               | `bash`                                   | Shell-Kommandos ausführen                                            | Hoch: Build, Git, Löschen, Netzwerk, Skripte      | `ask`, mit gezielten Ausnahmen                   |
| `task`               | `task`                                   | Andere Agenten/Subagents starten                                     | Mittel: kann indirekt weitere Tools nutzen               | Im kontrollierten Template `deny`, weil die Rollen direkt als Primary Agents gewählt werden |
| `skill`              | `skill`                                  | Wiederverwendbare Skills laden                                       | Niedrig bis mittel                                       | `allow` oder `ask`                               |
| `lsp`                | `lsp`                                    | Language-Server-Abfragen, z. B. Diagnosen/Symbole                    | Niedrig bis mittel, kann Ressourcen brauchen             | Für Code-Agenten bei vorhandenem LSP `allow`                           |
| `external_directory` | alle Datei-Tools außerhalb des Worktrees | Zugriff außerhalb des aktuellen Projektordners                       | Hoch: Zugriff auf fremde/private Ordner                  | `ask` oder `deny`                                |
| `todowrite`          | `todowrite`                              | Interne Aufgabenliste verwalten                                         | Niedrig                                                  | `allow`                                          |
| `webfetch`           | `webfetch`                               | Konkrete URL abrufen                                                 | Mittel: externe Inhalte/Netzwerk                         | `ask`                                            |
| `websearch`          | `websearch`                              | Websuche ausführen                                                   | Mittel bis hoch: unkontrollierte Quellen, Ablenkung      | Bei repository-zentrierter Arbeit meist `deny`                              |
| `question`           | `question`                               | Agent darf während Ausführung Rückfragen stellen                     | Niedrig                                                  | `allow`                                          |
| `doom_loop`          | Wiederholschutz                          | Greift, wenn derselbe Tool-Aufruf mehrfach identisch wiederholt wird | Schutzfunktion                                           | `ask` lassen                                     |

Die offiziellen Permission-Keys umfassen unter anderem `read`, `edit`, `glob`, `grep`, `bash`, `task`, `external_directory`, `todowrite`, `webfetch`, `websearch`, `lsp`, `skill`, `question` und `doom_loop`. OpenCode weist außerdem darauf hin, dass `edit` die Dateiänderungs-Tools `write`, `edit` und `patch` zusammen steuert. ([opencode.ai][2])

## Wichtigste Tools kurz erklärt

### `read`

Liest Dateien im Projekt.

```yaml
permission:
  read: allow
```

Sinnvoll für fast alle Agenten, weil ohne Lesen keine Analyse möglich ist. OpenCode blockiert `.env`-Dateien standardmäßig, während normale Dateien gelesen werden dürfen. ([opencode.ai][1])

### `edit`

Steuert alle Dateiänderungen.

```yaml
permission:
  edit: ask
```

Das ist die wichtigste Schutzregel. `edit` deckt laut Doku nicht nur exakte Änderungen ab, sondern auch `write` und `patch`; neue Dateien oder Überschreiben vorhandener Dateien laufen also ebenfalls über diese Permission. ([opencode.ai][3])

### `bash`

Erlaubt Terminal-Kommandos.

```yaml
permission:
  bash:
    "*": ask
    "git status*": allow
    "git diff*": allow
    "<build-command>": ask
    "git push*": deny
```

`bash` ist mächtig, weil damit Builds, Git-Kommandos, Skripte und theoretisch auch destructive Kommandos gestartet werden können. OpenCode erlaubt hier feingranulare Muster, z. B. `git status` erlauben, aber `git push` blockieren. ([opencode.ai][1])

### `glob` und `grep`

Diese beiden sind typische Analyse-Tools.

```yaml
permission:
  glob: allow
  grep: allow
```

Damit findet der Agent Dateien per Muster und durchsucht Inhalte. Verzeichnisstrukturen werden über `glob`, gezieltes Lesen oder kontrollierte Shell-Kommandos erfasst. Für Software-Repo-Analyse sind diese Tools unkritischer als `edit` oder `bash`.

### `lsp`

Nutzt Language-Server-Informationen.

```yaml
permission:
  lsp: allow
```

Für Code-Agenten ist das hilfreich, weil Diagnosen, Symbole oder projektbezogene Codeinformationen ausgewertet werden können. Für reine Text-/README-Agenten ist es weniger wichtig.

### `webfetch`

Ruft eine konkrete URL ab.

```yaml
permission:
  webfetch: ask
```

Beispiel: Der Agent soll eine konkrete Microsoft-, Radzen- oder OpenCode-Doku-URL lesen. `webfetch` ist gezieltes Abrufen, keine Suche.

### `websearch`

Startet eine Websuche.

```yaml
permission:
  websearch: deny
```

Das ist breiter als `webfetch`: Der Agent sucht selbst Quellen. Für repository-zentrierte Arbeit würde ich das standardmäßig deaktivieren, wenn externe Quellen für die Aufgabe nicht erforderlich sind. Lokale Projektdateien bleiben die primäre Quelle für den tatsächlichen Projektzustand.

### `external_directory`

Greift, wenn ein Tool außerhalb des aktuellen Projektordners arbeitet.

```yaml
permission:
  external_directory: ask
```

Das ist wichtig, wenn ein Agent z. B. `../anderes-repo` oder `$HOME` lesen oder ändern möchte. OpenCode beschreibt `external_directory` als Grenze für Pfade außerhalb des Projekt-Worktrees. ([opencode.ai][2])

### `task`

Startet andere Agenten/Subagents.

```yaml
permission:
  task: deny
```

Dieses Template verwendet direkt auswählbare Primary Agents. Deshalb bleibt `task` standardmäßig deaktiviert; sonst könnte ein Agent weitere Agenten anstoßen und die Nachvollziehbarkeit verschlechtern.

### `skill`

Lädt wiederverwendbare Skills.

```yaml
permission:
  skill: allow
```

Skills sind wiederverwendbare Anweisungen, die OpenCode bei Bedarf laden kann. Bei sauber gepflegten eigenen Skills ist `allow` sinnvoll; bei unklarer Skill-Landschaft eher `ask`. ([opencode.ai][4])

### `todowrite`

Erlaubt die OpenCode-interne Aufgabenliste.

```yaml
permission:
  todowrite: allow
```

Nützlich für längere Aufgaben, weil der Agent seine Arbeitsschritte sichtbar strukturieren kann. Kein direkter Codezugriff.

### `question`

Erlaubt Rückfragen.

```yaml
permission:
  question: allow
```

Für kontrollierte Arbeit sinnvoll. Lieber eine Rückfrage als eine dauerhaft falsche Annahme.

### `doom_loop`

Schutz gegen Wiederholungsschleifen.

```yaml
permission:
  doom_loop: ask
```

OpenCode triggert das, wenn derselbe Tool-Aufruf mehrfach identisch wiederholt wird. Das sollte man als Schutzfunktion nicht leichtfertig deaktivieren. ([opencode.ai][1])

## Beispiel für eine konservative Standard-Konfiguration

```yaml
permission:
  read:
    "*": allow
    "*.env": deny
    "*.env.*": deny
    "*.env.example": allow

  glob: allow
  grep: allow
  lsp: allow
  skill: allow
  todowrite: allow
  question: allow

  edit: ask

  bash:
    "*": ask
    "git status*": allow
    "git diff*": allow
    "git log*": allow
    "<read-only-tool-command>": allow
    "<build-command>": ask
    "git commit*": deny
    "git push*": deny
    "rm *": deny

  webfetch: ask
  websearch: deny
  task: deny
  external_directory: ask
  doom_loop: ask
```


## Pfadbegrenzte Schreibrechte für Workflow-State

Der Agent `workflow-syncer` darf ausschließlich unter `.project/` schreiben. Dafür nutzt das Template die granulare `edit`-Objektsyntax:

```yaml
permission:
  edit:
    "*": deny
    ".project/*": ask
    ".project/**": ask
```

Die allgemeine Deny-Regel steht zuerst; die spezifischeren `.project`-Muster folgen danach. Dadurch kann der Agent Work-State synchronisieren, aber keinen Produktivcode oder normale Projektdokumente verändern. Auch innerhalb von `.project/` bleibt jede Änderung freigabepflichtig (`ask`).

## Merksatz 

```text
Lesen und Suchen darf der Agent meistens.
Ändern, Shell, Web und externe Ordner nur kontrolliert.
Git-Push, destruktive Befehle und unkontrollierte Websuche bleiben gesperrt.
```

[1]: https://opencode.ai/docs/permissions/ "Permissions | OpenCode"
[2]: https://opencode.ai/docs/agents/ "Agents | OpenCode"
[3]: https://opencode.ai/docs/tools/ "Tools | OpenCode"
[4]: https://opencode.ai/docs/skills/ "Agent Skills"
