# 5. AGENTS.md – The Rules of the Game

For me, `AGENTS.md` is the constitution of the project.

It should be important, but not large.

## What belongs there

For example:

```markdown
# Working Rules

- Before changing anything, inspect the existing code and project rules first.
- Do not refactor working code for style reasons alone.
- An approval applies only to the explicitly named work step.
- Do not continue automatically after completing a step.
- Destructive actions require explicit approval.
```

These are rules that apply to almost every task.

## What does not belong there

Twenty pages of architecture, old bug reports, complete tasks or every detail of the current change do not belong there.

That is what `.project/` is for.

If `AGENTS.md` becomes too large, we pay the context cost in every session even though most of the information is irrelevant at that moment.

## Rule or knowledge?

A simple distinction helps:

```text
How should the work be done?
→ AGENTS.md

What do we know about this project?
→ .project/
```

That keeps `AGENTS.md` stable while the project context can grow and be maintained independently.
