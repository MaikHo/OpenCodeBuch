# 11. Skills – Load Knowledge When It Is Needed

A skill is reusable working knowledge.

It lives under:

```text
.opencode/skills/<name>/SKILL.md
```

The template currently contains:

```text
architecture-knowledge
change-governance
code-review
context-control
git-checkpoint
project-context
resume-work
small-step-workflow
work-checkpoint
workflow-guide
```

## Why not put everything in `AGENTS.md`?

Because `AGENTS.md` matters in every session.

A specific code-review workflow or the rules around architecture knowledge are not needed for every task.

Skills keep that knowledge available without loading it permanently into the context.

## Agent or skill?

A simple rule:

```text
Who is working?
→ Agent

How should a specific task be handled?
→ Skill
```

Example:

`net-reviewer` is a role.

`code-review` is reusable review knowledge.

## Skills need to be concrete

A good skill does not just say:

```text
Review the code well.
```

Instead, it describes things such as:

- which facts are required,
- which assumptions are forbidden,
- which order makes sense,
- how uncertainty is marked,
- what result is expected.

That turns a skill into reproducible working knowledge instead of another long prompt.
