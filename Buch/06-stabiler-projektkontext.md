# 6. Stabiler Projektkontext

Projektwissen soll nicht jedes Mal neu aus dem Quellcode erraten werden.

Dafür gibt es im Template `.project/`.

## Stabiles Wissen

Die wichtigsten Dateien sind:

```text
.project/projekt.md
.project/architecture.md
.project/entscheidungen.md
.project/tech.md
.project/tasks.md
.project/bugs.md
.project/context/repository.md
.project/context/architecture-fingerprint.yaml
```

### `projekt.md`

Beschreibt Zweck, Grenzen und fachlichen Rahmen des Projekts.

### `architecture.md`

Enthält die ausführlichere technische Architektur und deren Zusammenhänge.

### `entscheidungen.md`

Hier gehören echte Entscheidungen mit Begründung und Quelle hinein.

Nicht:

```text
Das wurde wahrscheinlich aus Performancegründen so gebaut.
```

Wenn der Grund nicht bekannt ist, ist er nicht bekannt.

### `tech.md`

Enthält Technologien, Laufzeit, wichtige Werkzeuge und technische Randbedingungen.

### `repository.md`

Ist die kompakte technische Bestandsaufnahme des vorhandenen Repositories.

## Architektur-Fingerprint

Die Datei:

```text
.project/context/architecture-fingerprint.yaml
```

ist keine zweite Architekturdokumentation.

Sie ist eine kleine Navigationskarte für Agenten:

```yaml
architecture:
  style: "<Architekturstil>"
  entrypoints:
    - "<Entry Point>"
  modules:
    - "<Modul>"
  boundaries:
    - "<wichtige Grenze>"
```

Damit muss ein Agent nicht für jede kleine Aufgabe die komplette Architektur neu rekonstruieren.

## Beobachtet ist nicht entschieden

Architekturwissen wird in vier Zustände getrennt:

```text
Observed
Decided
Unknown
Conflict
```

**Observed** heißt: Das kann ich im Repository belegen.

**Decided** heißt: Dazu gibt es eine dokumentierte Entscheidung und Quelle.

**Unknown** heißt: Der Grund ist nicht dokumentiert.

**Conflict** heißt: Zwei Quellen widersprechen sich. Dann wird nicht einfach die angenehmere Version ausgewählt.

Diese Trennung ist gerade bei älteren Projekten wichtig. Code zeigt, **was** gemacht wurde. Er erklärt nicht automatisch, **warum** es so gemacht wurde.

## Pflege statt Ablagefriedhof

Projektkontext soll aktuelles Wissen enthalten, nicht jeden Zwischenstand der letzten drei Jahre.

Abgeschlossene Arbeit gehört in Checkpoints, Pläne, Git und ChangeLog. Stabiles Wissen bleibt im Projektkontext.
