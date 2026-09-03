# Vorwort

Ich nutze KI beim Programmieren gern. Aber ich möchte trotzdem wissen, was in meinem Projekt passiert.

Genau daraus ist dieser Workflow entstanden.

Mir geht es nicht darum, einen Agenten auf ein Repository loszulassen und später zu hoffen, dass schon alles passen wird. Ich möchte kleine, nachvollziehbare Arbeitsschritte. Ich möchte sehen, warum etwas geändert wird. Und ich möchte jederzeit stoppen können.

Das Ganze ist mit OpenCode entstanden. Als Modell kann dabei lokal oder über einen Cloud-Anbieter gearbeitet werden. Ich selbst bevorzuge oft ein lokales Modell, weil ich damit unabhängig arbeiten kann und genau weiß, wo meine Daten verarbeitet werden. Das ist aber eine Präferenz und keine Voraussetzung für diesen Workflow.

## Was dieses Buch zeigen soll

Das Buch erklärt nicht nur, welche Dateien im Template liegen. Wichtiger ist mir das **Warum** dahinter:

- Warum `AGENTS.md` klein bleiben sollte.
- Warum Projektwissen nicht im Chat verschwinden darf.
- Warum ich große Aufgaben in kleine Steps zerlege.
- Warum der nächste Step immer wieder bewusst freigegeben wird.
- Warum Agenten unterschiedliche Rechte haben.
- Warum Skripte Aufgaben übernehmen sollen, die ein LLM nicht selbst erledigen muss.
- Warum ein abgeschlossener Step einen nachvollziehbaren Zustand im Repository hinterlassen muss.

Der zentrale Gedanke ist dabei ziemlich einfach:

> Die KI soll mir Arbeit abnehmen, aber nicht die Kontrolle über die Arbeit übernehmen.

## Buch und Template

Dieses Repository enthält das Buch in zwei Sprachen und das praktische Template:

```text
Buch/       # deutsche Fassung
Book_EN/    # englische Fassung
Template/   # praktische Umsetzung
```

Die beiden **Buchfassungen** erklären denselben Aufbau und dieselben Entscheidungen.

Das **Template** ist die praktische Umsetzung. Wer den Workflow verwenden möchte, arbeitet später mit den Dateien aus `Template/` im eigenen Repository.

Das Buch beschreibt daher immer denselben Stand, den das Template tatsächlich umsetzt. Eigene Beispiele sind nur Beispiele und keine versteckten Projektvorgaben.
