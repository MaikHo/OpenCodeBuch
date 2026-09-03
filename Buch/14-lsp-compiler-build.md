# 14. LSP, Compiler und Build sind nicht dasselbe

Diese Werkzeuge liefern unterschiedliche Informationen.

## LSP

Ein Language Server hilft bei Dingen wie:

```text
Symbolauflösung
Referenzen
Definitionen
Typinformationen
Diagnosen während der Bearbeitung
```

Für Agenten ist das nützlich, weil Zusammenhänge gezielter gefunden werden können als über reine Textsuche.

## Compiler

Der Compiler beantwortet eine andere Frage:

```text
Ist dieser Code für das gewählte Ziel syntaktisch und semantisch kompilierbar?
```

Eine LSP-Diagnose ist kein Ersatz für den Compiler.

## Build

Der Build umfasst häufig noch mehr:

```text
Projektauflösung
Abhängigkeiten
Codegenerierung
Ressourcen
plattformabhängige Schritte
```

Darum kann LSP funktionieren, während ein Build in der aktuellen Umgebung nicht möglich ist.

## Warum das im Workflow wichtig ist

Wenn ein Step als Verifikation `dotnet build`, `cmake --build ...` oder einen anderen Build-Befehl festlegt, dann muss genau dieser Befehl tatsächlich ausgeführt worden sein, bevor `Verified: PASSED` eingetragen wird.

Ein Agent darf nicht aus einer guten LSP-Diagnose schließen, dass der Build schon passen wird.
