# 1. The Core Principle

A coding agent can change a lot of code very quickly. That is both its strength and its biggest risk.

That is why I do not want to work like this:

```text
Here is my project. Add feature X and finish everything.
```

That sounds convenient, but it creates one large block of work. If a wrong assumption slips in, it can spread across several files and possibly across the architecture.

My workflow therefore separates four things:

```text
understand
→ plan
→ work on exactly one step
→ persist the state in a traceable way
```

## One approval applies to exactly one step

This is one of the most important rules in the whole workflow.

If the plan contains:

```text
T-003
```

and I approve that step, it does not mean:

```text
T-003
→ then T-004
→ then T-005
```

It means only:

```text
work on T-003
→ verify it
→ update the state
→ STOP
```

Only then do I decide again.

## The chat is not the project state

Another basic rule is:

> Anything needed to continue the work belongs in the repository, not only in the chat.

The template therefore contains, among other things:

```text
.project/activeContext.md
.project/work/current.yaml
.project/work/RESUME.md
.project/specs/
.project/plans/
.project/CHANGELOG.md
```

That allows a new OpenCode session to continue without the previous chat history being the only source of knowledge.

## No process for the sake of process

Not every change needs a spec and a plan.

A small, clearly bounded change is allowed to stay small. The full workflow with spec, plan and individual steps only becomes useful for larger or riskier work.

The goal is not bureaucracy.

The goal is control with as little additional work as possible.
