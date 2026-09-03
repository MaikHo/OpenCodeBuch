# 9. Commands – The User Interface

Commands make sure I do not have to formulate recurring workflows from scratch every time.

They live under:

```text
.opencode/commands/
```

The template currently contains these commands:

| Command | Purpose |
|---|---|
| `/help-workflow` | answer a workflow usage question |
| `/work-status` | show the current work state |
| `/repo-inventory` | create a rough repository inventory |
| `/project-context` | determine relevant project context |
| `/analyze` | analyze a task without changing anything immediately |
| `/structure-work` | structure a larger piece of work |
| `/create-spec-to-plan` | prepare a larger .NET change as a spec and then as a plan |
| `/work-start` | activate an approved planned piece of work |
| `/next-step T-xxx` | explicitly approve exactly one .NET step |
| `/complete-step T-xxx` | synchronize a completed step into `.project/` |
| `/work-continue` | reconstruct existing state without implicitly approving anything |
| `/work-finish` | cleanly finish a completed work session |
| `/context-compact` | prepare a handover for a context switch |
| `/implement-change` | handle a small .NET change without the full spec/plan workflow |
| `/review-step` | review one change step |
| `/git-checkpoint` | inspect the Git diff and scope of a step |
| `/update-context` | deliberately update stable project context |
| `/readme-draft` | draft a README from the repository |
| `/bug-dataflow` | analyze the data flow of a bug |
| `/review-dotnet` | .NET-specific review support |

## The most important operating sequence

Before a step, I can check the state first:

```text
/work-status
```

Example output:

```text
Current / next step: T-003
```

I deliberately approve exactly that step:

```text
/next-step T-003
```

After implementation and verification, the persistent state is synchronized:

```text
/complete-step T-003
```

Important:

```text
/next-step
```

without a step ID does not start a step.

A `next_step` stored in `current.yaml` is work state, not approval.

## A command is not an agent

A command describes the workflow. An agent describes the role that executes it.

That means, for example, that a writing step can run with `net-coder`, while synchronization of `.project/` is handled by `workflow-syncer`.
