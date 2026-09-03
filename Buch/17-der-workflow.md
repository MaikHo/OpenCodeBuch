# 17. Der Workflow als Ganzes

Bis hierhin waren die Bausteine einzeln erklärt. Jetzt hängen wir sie zusammen.

## Kleine Arbeit

```text
Anforderung
↓
/implement-change
↓
Analyse
↓
kleine Änderung
↓
Verifikation
↓
Review / Diff
↓
STOP
```

Dafür brauche ich keinen großen Planapparat.

## Größere Arbeit

```text
Anforderung
↓
/create-spec-to-plan
↓
Spec-Vorschlag
↓
meine Freigabe
↓
Plan-Vorschlag
↓
meine Freigabe
↓
/work-start
↓
/work-status
↓
/next-step T-001
↓
Umsetzung
↓
Verifikation
↓
/complete-step T-001
↓
STOP
```

Danach beginnt nicht automatisch T-002.

Ich kann zuerst den Zustand ansehen:

```text
/work-status
```

und anschließend bewusst freigeben:

```text
/next-step T-002
```

## Warum diese Bedienung?

Weil sie den Workflow sichtbar macht.

Ich muss nicht wissen, welcher Agent welche Datei intern aktualisiert. Dafür sind Commands da.

Trotzdem kann ich jederzeit in `.project/` nachsehen, was der aktuelle Zustand ist.

Das ist für mich der richtige Mittelweg zwischen komfortabler Bedienung und nachvollziehbarer Technik.
