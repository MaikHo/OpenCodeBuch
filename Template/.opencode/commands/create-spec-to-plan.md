---
description: Führt eine größere NET-Änderung kontrolliert von der lösungsneutralen Spec bis zu einem freigegebenen persistenten Baby-Step-Plan.
agent: net-spec-writer
---

# create-spec-to-plan

Erzeuge aus `$ARGUMENTS` zunächst eine **lösungsneutrale Spec** und danach – getrennt durch eine ausdrückliche Freigabe – einen persistenten Plan.

## ID-Regel

1. Ermittle vor dem Vorschlag die höchste vorhandene numerische ID unter `.project/specs/backlog/`, `.project/specs/active/` und `.project/specs/done/`.
2. Verwende die nächste freie vierstellige ID (`0001`, `0002`, ...).
3. Prüfe unmittelbar vor jedem Schreiben erneut, dass diese ID nicht inzwischen belegt ist. Bei Konflikt stoppen und eine neue freie ID vorschlagen.

## Phase 1 – Spec

1. Lies `AGENTS.md`, `.project/activeContext.md` und nur den für die Anforderung nötigen Projektkontext.
2. Beschreibe **Was und Warum**, noch nicht die technische Lösung.
3. Trenne Ziel, Nicht-Ziele, Ist-Zustand, Soll-Verhalten, Randbedingungen, Akzeptanzkriterien, Risiken und offene Fragen.
4. Erfinde keine Architekturgründe; nutze `architecture-knowledge`.
5. Zeige die Spec zuerst nur als Vorschlag.
6. **STOP** und warte auf `Spec übernehmen`.
7. Erst nach dieser Freigabe die Spec unter `.project/specs/backlog/<id>-<slug>.md` speichern.

## Phase 2 – Plan

Nach `Spec übernehmen`:

1. Erzeuge ausschließlich aus der gespeicherten Spec und dem nötigen Repository-Kontext einen kleinen Plan.
2. Jeder Step behandelt genau ein Problem und enthält mindestens:
   - `Do:`
   - `Verify:`
   - `Verified: NOT RUN`
3. Plane gegen das Repository, wie es existiert.
4. Architekturänderungen sind kein Nebeneffekt und benötigen einen eigenen Auftrag.
5. Zeige den Plan zuerst nur als Vorschlag.
6. **STOP** und warte auf `Plan übernehmen`.

Nach `Plan übernehmen`:

1. Verschiebe die bereits freigegebene Spec von `.project/specs/backlog/<id>-<slug>.md` nach `.project/specs/active/<id>-<slug>.md`. Es darf danach keine zweite Backlog-Kopie derselben Spec bestehen.
2. Lege den freigegebenen Plan unter `.project/plans/active/<id>-<slug>.plan.md` ab.
3. Prüfe, dass genau eine aktive Spec und der dazugehörige Plan für diese ID existieren.
4. Starte **keine Implementierung**.
5. Empfehle anschließend `/work-start`.
6. **STOP**.

## Grundregel

Eine Planfreigabe autorisiert die Persistierung von Spec und Plan, aber **nicht** die Implementierung von `T-001`.
