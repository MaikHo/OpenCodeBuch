# 20. Complete Workflow

Let us take a larger change in an existing .NET project.

## 1. Understand the repository

If the repository is unfamiliar:

```text
/repo-inventory
```

Afterwards, relevant project context can be created or updated:

```text
/project-context
```

## 2. Create spec and plan

```text
/create-spec-to-plan Make processing of large input files more robust
```

The command first creates a spec proposal.

I review it.

Only after my approval is the spec accepted and a plan created from it.

I review the plan as well.

## 3. Start the work

After the plan has been approved:

```text
/work-start
```

Then:

```text
/work-status
```

Example:

```text
Current / next step: T-001
```

## 4. Approve exactly one step

```text
/next-step T-001
```

That approves exactly T-001.

## 5. Review the result

After the change, the verification defined in the step is carried out.

I can also inspect the diff:

```text
/git-checkpoint
```

## 6. Complete the step

When the step is genuinely finished:

```text
/complete-step T-001
```

Now the plan, checkpoint, work state, active context, resume file and changelog are synchronized.

Then it stops.

## 7. Deliberately start the next step

```text
/work-status
```

might show:

```text
Current / next step: T-002
```

Only then:

```text
/next-step T-002
```

## 8. New session

When a later session starts:

```text
/work-continue
```

reconstructs the existing state and shows where work can continue.

The same rule still applies: a reconstructed `next_step` is not automatic approval.

## What is actually happening here

The chat is replaceable.

The model is replaceable.

The session is replaceable.

The work state remains in the repository.

That is the goal.
