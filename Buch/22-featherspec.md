# 22. FeatherSpec als Ideengeber

Mein OpenCode-Workflow ist nicht FeatherSpec und soll es auch nicht werden.

Der bestehende Aufbau mit `AGENTS.md`, Agenten, Skills, Commands, Projektkontext, kleinen freigegebenen Steps und kontrollierter Arbeit war bereits da.

Beim Blick auf FeatherSpec sind aber ein paar Ideen aufgefallen, die diesen Ansatz sinnvoll geschärft haben.

Dazu gehören vor allem:

- ein bewusst kleiner Active Context,
- persistente Pläne statt Planwissen nur im Chat,
- ein klarer Nachweis pro Step,
- ein kompakter Architektur-Fingerprint,
- die saubere Trennung von beobachtetem, entschiedenem, unbekanntem und widersprüchlichem Architekturwissen.

Diese Konzepte wurden nicht 1:1 übernommen. Sie wurden an den bestehenden OpenCode-Workflow angepasst.

Der wichtigste Unterschied bleibt für mich die bewusste Kontrolle zwischen den Steps:

```text
Step bearbeiten
→ verifizieren
→ Zustand synchronisieren
→ STOP
→ nächste Freigabe abwarten
```

## Danke

Ein ausdrücklicher Dank geht an **Gregor Biswanger** für FeatherSpec.

Der Blick auf FeatherSpec hat mir geholfen, einige Gedanken meines eigenen OpenCode-Workflows weiter zu schärfen – besonders bei persistenten Plänen, kompaktem Arbeitskontext, überprüfbaren Arbeitsschritten und beim ehrlichen Umgang mit Architekturwissen.

FeatherSpec wurde hier nicht übernommen. Die für diesen Workflow passenden Ideen wurden bewusst ausgewählt, vereinfacht und an den bereits bestehenden OpenCode-Ansatz angepasst.

**Danke für die Inspiration, Gregor.**
