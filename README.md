# KI mit OpenCode

Lokale Modelle sind meine bevorzugte Variante; der Workflow funktioniert genauso mit Cloud-Providern.

Das Repository enthält das Buch auf Deutsch und Englisch sowie das praktisch verwendbare Template:

```text
Buch/       # deutsche Fassung
Book_EN/    # English edition
Template/   # verwendbarer OpenCode-Workflow
```

## Deutsch

`Buch/` erklärt meinen kontrollierten OpenCode-Workflow: Modelle lokal über Ollama oder LM Studio **oder über Cloud-Provider**, Projektkontext, Agenten, Skills, kleine kontrollierte Arbeitsschritte, persistenter Arbeitszustand, Spec → Plan → Step und Skripte zur Context-Reduktion.

Lokal ist dabei meine bevorzugte Arbeitsweise, aber keine Voraussetzung des Workflows.

Einstieg: [Buch/INHALT.md](Buch/INHALT.md)

## English

`Book_EN/` is the standalone English edition of the same book. It describes exactly the same workflow and template as the German edition.

Start here: [Book_EN/CONTENTS.md](Book_EN/CONTENTS.md)

## Template

`Template/` ist die praktisch verwendbare Umsetzung des Workflows. Der Ordner kann als Ausgangspunkt für ein eigenes Projekt verwendet und angepasst werden.

Einstieg:

- [Template/README.md](Template/README.md)
- [Template/docs/BENUTZERHANDBUCH.md](Template/docs/BENUTZERHANDBUCH.md)
- [Template/docs/DATEI-REFERENZ.md](Template/docs/DATEI-REFERENZ.md)

Für den praktischen Start werden die Workflow-Dateien aus `Template/` in das Zielrepository übernommen; vorhandene Projektdateien wie `README.md`, `.gitignore` und `AGENTS.md` werden bewusst zusammengeführt statt blind überschrieben.

Für Ollama und LM Studio liegen vollständige Beispielkonfigurationen unter `Template/config/`. Cloud-Provider können über die normale OpenCode-Provider-Konfiguration beziehungsweise `/connect` angebunden werden.

## Grundgedanke / Core idea

> Die KI soll mir Arbeit abnehmen, aber nicht die Kontrolle über die Arbeit übernehmen.
>
> AI should take work off my hands, but it should not take control of the work away from me.

Der Repository-Zustand soll so vollständig sein, dass eine neue OpenCode-Session nicht auf den alten Chatverlauf oder das Gedächtnis eines bestimmten Modells angewiesen ist.

## Lizenz

Dieses Repository steht unter der [MIT License](LICENSE).
