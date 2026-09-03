# 15. Governance and Permissions

Prompt rules alone are useful, but they are not a technical boundary.

That is why I combine three layers:

```text
AGENTS.md
→ general rules

Agent / Skill
→ role-specific and task-specific rules

OpenCode Permissions
→ technical guardrails
```

## No implicit approval

A stored next step is not an approval.

A plan is not an approval for full implementation.

A successfully completed step is not an approval for the next one.

## Destructive actions

Things like deletion, reset, force-push or uncontrolled repository changes do not belong in a standard workflow.

If they are necessary at all, I want a deliberate decision first.

## Read-only roles

Reviewers and context retrievers normally do not need write permissions.

The template does not only describe that rule. It models it through agent permissions.

## Protect `.project/`

Production code and persistent workflow state are separated.

The coder edits code.

After a completed step, `workflow-syncer` updates the official state under `.project/`.

That way, the same agent cannot simply write code and then declare on its own that everything was successfully completed.

## Permissions are not a complete sandbox

Technical permissions do not replace understanding the tools and the environment being used.

But they significantly reduce the possible blast radius and make roles easier to reason about.
