# 16. Git as a Control Mechanism

Git is directly part of the AI workflow for me.

Not because AI should commit automatically, but because Git is very good at showing **what actually changed**.

## Before a step

I want to know whether the working tree already contains changes.

Otherwise, I cannot cleanly distinguish later:

```text
What was already there?
What did this step change?
```

## After a step

The most important thing to look at is the diff.

Questions I ask:

- Were only the expected files changed?
- Is the scope appropriate for the step?
- Are there unrelated side changes?
- Was anything reformatted or refactored unnecessarily?

The template provides:

```text
/git-checkpoint
```

## Small steps create readable diffs

This is one of the reasons I prefer small steps.

I can review a diff with 40 understandable lines.

A diff with 4,000 lines, several refactorings and a functional change at the same time is much harder to judge.

## Who commits?

The workflow does not take that decision away from me.

The agent can explain the state and recognize a sensible point for a commit. Commit and push remain deliberate actions.

That makes Git a safety net and a record, not an autopilot.
