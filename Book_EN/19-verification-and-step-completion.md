# 19. Verification and Step Completion

"Code written" is not a completion criterion.

A step is complete only after the planned verification was actually carried out and the result was documented.

## `Verify` and `Verified`

Example:

```markdown
Verify:
dotnet build

Verified:
PASSED

Evidence:
Build succeeded, 0 errors.
```

Or for a manual check:

```markdown
Verify:
manual — review the generated configuration file

Verified:
MANUAL REQUIRED
```

The agent must not invent a successful result.

If a command was not run, the state remains, for example:

```text
NOT RUN
```

## A step is synchronized completely

After successful completion, the workflow uses this sequence:

```text
update active plan
↓
write checkpoint
↓
update current.yaml
↓
update activeContext.md
↓
update RESUME.md
↓
append CHANGELOG.md
↓
STOP
```

`/complete-step T-xxx` is responsible for this synchronization.

## Changelog

The changelog does not contain every keystroke and every unfinished intermediate state.

It is updated after a completed step.

Example:

```markdown
## 2026-09-03

### T-003 — Split processing

Changed:
- src/Importer.cs
- src/BatchWriter.cs

Reason:
The existing processing exceeded a technical limit with large inputs.

Verification:
dotnet build

Result:
PASSED
```

That means the plan describes what is supposed to be done now, while the changelog describes what was actually completed.
