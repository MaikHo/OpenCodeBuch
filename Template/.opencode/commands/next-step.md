---
description: Startet und bearbeitet genau den ausdrücklich genannten, noch offenen .NET-Step.
agent: net-coder
---

# next-step

Bearbeite genau den in `$ARGUMENTS` genannten Step.

Beispiel:

```text
/next-step T-001
```

Die bewusste Ausführung dieses Commands mit einer eindeutigen Step-ID ist die Freigabe **nur für diesen Step**.

## Regeln

1. Wenn keine eindeutige Step-ID angegeben ist: nichts ändern, nach der Step-ID fragen und STOP.
2. Lies `AGENTS.md`, `.project/activeContext.md`, `.project/work/current.yaml` und den aktiven Plan.
3. Prüfe, dass der genannte Step im aktiven Plan existiert und noch nicht abgeschlossen ist.
4. Prüfe, dass keine andere Step-ID durch den Benutzer freigegeben wurde.
5. Lade nur den für diesen Step nötigen Projektkontext.
6. Bearbeite genau diesen Step; keine Nebenrefactorings und keinen Folgeschritt.
7. Führe die im Plan definierte, nicht destruktive `Verify`-Methode aus, soweit sie ausführbar ist. Erfinde kein Ergebnis.
8. Ändere keine `.project/`-Zustandsdateien; deren Synchronisation erfolgt danach über `/complete-step <Step-ID>`.
9. Fasse Ergebnis, geänderte Dateien und reale Verifikation zusammen.
10. **STOP**.

Nach erfolgreicher Umsetzung und realer Verifikation als nächsten Command ausschließlich vorschlagen:

```text
/complete-step <Step-ID>
```

Diesen Command nicht selbst starten.
