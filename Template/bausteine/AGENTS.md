# Projektregeln

## Arbeitsweise

- Analysiere zuerst den betroffenen Bereich.
- Nimm keine Änderungen ohne explizite Freigabe vor.
- Bearbeite nur die aktuell freigegebene Aufgabe.
- Beginne keinen Folgeschritt selbstständig.
- Begründe vorgeschlagene Änderungen technisch.

## Änderungen

- Keine destruktiven Git-Aktionen ohne ausdrückliche Freigabe.
- Keine großflächigen Refactorings ohne Auftrag.
- Vorhandene Schnittstellen nicht stillschweigend ändern.

## Qualität

- Vorhandene Build-, Lint- und Validierungswege berücksichtigen.
- Neue Logik modular und nachvollziehbar halten.
- KISS vor unnötigen Abstraktionen.
## Step Boundary

- Eine Freigabe gilt ausschließlich für den ausdrücklich freigegebenen Step.
- Nach Implementierung und Verifikation eines Steps: Plan, `current.yaml`, `activeContext.md` und ChangeLog synchronisieren.
- Danach Ergebnis zeigen und **STOP**.
- Kein Folgeschritt wird automatisch begonnen.
- `Verified` darf nur ein tatsächlich ausgeführtes oder vom Benutzer bestätigtes Ergebnis enthalten.
- Beobachtetes Architekturwissen ist keine Begründung: verwende `observed`, `decided`, `unknown` oder `conflict`.
- Plane gegen das Repository, wie es existiert. Architekturänderungen benötigen einen eigenen Auftrag und eine neue Freigabe.

