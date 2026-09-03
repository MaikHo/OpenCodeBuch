# AGENTS.md — kontrollierter Software-Workflow

Diese Regeln gelten für OpenCode in diesem Repository. Technologiespezifische Details liegen zusätzlich in den jeweiligen `net-*`- oder `cpp-*`-Agenten.

## Grundsatz

Die KI unterstützt die Arbeit, übernimmt aber nicht die Kontrolle über den Arbeitsablauf.

- erst verstehen,
- dann planen,
- nur den ausdrücklich freigegebenen Scope ändern,
- tatsächlich verifizieren,
- Zustand dokumentieren,
- **STOP**.

## Allgemeine Arbeitsregeln

- Bestehendes Repository zuerst beobachten und einordnen.
- Funktionierenden Code nicht allein aus Stilgründen ändern.
- Keine stillen Architekturwechsel.
- Keine unnötigen Refactorings.
- Keine neuen Bibliotheken, Frameworks, Buildsysteme oder Sprachstandard-Upgrades ohne Begründung und ausdrückliche Freigabe.
- Bei Unsicherheit über Anforderungen, Auswirkungen oder historische Gründe anhalten und nachfragen.
- Nur Dateien anfassen, die zum freigegebenen Scope gehören.
- Keine generierten Dateien blind ändern.
- Keine Secrets, Tokens oder produktiven Zugangsdaten in Code oder Doku schreiben.
- Keine Lösch-, Reset-, Force-Push-, Datenverlust-, Migrations- oder produktionsnahen Aktionen ohne ausdrückliche Freigabe.
- Git-Commit und Push bleiben Benutzerentscheidungen.

## Architekturwissen

Nutze für bestehende Projekte die Zustände:

- `observed` – im Repository belegbar,
- `decided` – dokumentierte Entscheidung mit Quelle,
- `unknown` – Grund nicht dokumentiert,
- `conflict` – belastbare Quellen widersprechen sich.

Keine plausible Begründung als Projektwissen erfinden. Plane gegen das Repository, wie es existiert. Architekturänderungen sind ein eigener Auftrag.

## Technologiespezifische Agenten

### .NET

Alle .NET-spezifischen Rollen tragen `net-` im Agentennamen. Sie enthalten Regeln für C#/.NET und – je nach Rolle – Console, WPF, WinForms, Blazor oder weitere im Repository beobachtete .NET-Technologien.

Öffentliche C#-APIs werden mit `///` XML-Dokumentation versehen, wenn Code erstellt oder geändert wird.

### C++

C++-spezifische Rollen tragen `cpp-` im Agentennamen. Sie berücksichtigen vorhandenes Buildsystem, Toolchain, C++-Standard, Header-/Source-Struktur, Ownership/RAII und API-/ABI-Risiken, ohne ungefragt zu modernisieren.

## Persistenter `.project/`-Workflow

`.project/README.md` definiert die führenden Quellen.

Für eine aktive längere Arbeit ist die Startreihenfolge:

```text
AGENTS.md
→ .project/activeContext.md
→ .project/work/current.yaml
→ aktive Spec
→ aktiver Plan
→ letzter Checkpoint / RESUME bei Bedarf
→ nur dann benötigte Projektdateien
```

Der Chat ist kein dauerhafter Work-State.

## Kleine vs. größere Änderung

### Kleine Änderung

Darf direkt analysiert und nach expliziter Freigabe umgesetzt werden, wenn Scope, Auswirkungen und Verifikation überschaubar sind.

### Größere Änderung

```text
/create-spec-to-plan <Anforderung>
→ Spec freigeben
→ Plan freigeben
→ /work-start
→ für .NET /next-step T-xxx bzw. passenden Technologie-Agenten bewusst wählen
→ genau einen Step implementieren
→ Verify / Verified
→ /complete-step T-xxx
→ STOP
```

## Step Boundary

Eine Freigabe gilt ausschließlich für den ausdrücklich freigegebenen Step.

Nach einem erfolgreichen Step wird in dieser Reihenfolge synchronisiert:

1. aktiver Plan,
2. Checkpoint,
3. `current.yaml`,
4. `activeContext.md`,
5. `RESUME.md`,
6. `CHANGELOG.md`.

Danach Ergebnis zeigen und **STOP**.

`next_step` bedeutet nur „logisch als Nächstes möglich“. Es ist keine Freigabe.

## Verifikation

`Verify` beschreibt, wie ein Step geprüft werden soll. `Verified` enthält nur das tatsächlich ausgeführte oder vom Benutzer bestätigte Ergebnis.

Erlaubte Beispiele sind abhängig vom Projekt, etwa:

- Build/Compiler,
- Linter oder statische Analyse,
- projektspezifisches Validierungsskript,
- Dateivergleich,
- manuelle Prüfung.

Kein Haken ohne realen Nachweis.

## Keine Agenten-Kaskaden

- `task`/Subagenten bleiben standardmäßig gesperrt.
- Agenten sind direkt auswählbare Rollen.
- Der Workflow skaliert über kleine Steps, persistente Zustände und gezielten Context – nicht über autonome Agentenschwärme.

## Ausgabe

Bevorzugte Struktur:

1. Befund
2. Relevante Dateien
3. Risiken / Unsicherheiten
4. Vorschlag oder ausgeführter freigegebener Step
5. Verifikation / realer Status
6. Nächster möglicher Schritt – **nicht automatisch freigegeben**
