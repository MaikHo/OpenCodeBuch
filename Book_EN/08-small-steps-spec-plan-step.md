# 8. Small Steps: Spec → Plan → Step

Not every task has the same size.

That is why there are two paths.

## Small change

If the change is clear, local and manageable, the short path is enough:

```text
requirement
→ analyze
→ exactly one small change
→ verify
→ STOP
```

For example:

```text
/implement-change
```

## Larger change

For larger work, I separate three levels:

```text
Spec
→ What and why?

Plan
→ How do we proceed?

Step
→ Exactly one concrete change.
```

The spec should not already lock in the preferred implementation.

Example:

```text
A large input file must be processed without the existing
processing failing because of a technical limit.
```

Only the plan decides which technical solution will be used.

## Persistent plans

A plan does not live only in the chat. It is stored under:

```text
.project/plans/active/
```

A step can look like this:

```markdown
### T-003 — Split the processing

Status: Open

Do:
Split the existing processing into controlled batches.

Verify:
dotnet build

Verified:
NOT RUN
```

`Verify` describes **how** the step is supposed to be checked.

`Verified` records **what actually happened**.

Those are two different things.

## Small enough

A good step handles exactly one problem, creates an understandable diff, and can be checked independently.

If a step says:

```text
Clean up the architecture, modernize data access,
rebuild logging and improve the UI.
```

then it is no longer a step.

## No automatic chain

Even if the plan contains T-001 through T-010, the workflow does not run through them automatically.

An approved step always ends with STOP.
