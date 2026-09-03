# 18. Persistent Work State

Longer work needs a state outside the chat.

The template deliberately separates several responsibilities.

## Source of truth

| Information | Leading source |
|---|---|
| content and status of a step | active plan |
| current work state | `.project/work/current.yaml` |
| small overview | `.project/activeContext.md` |
| handover to a new session | `.project/work/RESUME.md` |
| completed step state | checkpoint |
| long-term change history | `.project/CHANGELOG.md` |
| actual file changes | Git diff |

This matters because otherwise three files could tell three different versions of the "truth".

## `current.yaml`

This file is the machine-readable work state.

Example:

```yaml
status: in_progress
active_spec: ".project/specs/active/0012-import.md"
active_plan: ".project/plans/active/0012-import.plan.md"
current_step: "T-003"
next_step: "T-003"
verification:
  status: "not_run"
  method: "dotnet build"
  result: ""
  evidence: ""
  verified_at: ""
```

`next_step` explicitly does not mean "approved".

## `activeContext.md`

This is the small dashboard for humans and models.

It is derived from the actual state and deliberately kept small.

## `RESUME.md`

This file is intended for resuming work.

If a session ends or the context is deliberately switched, the next session does not need the old chat. It receives a short handover and can reread the leading files.

## Checkpoints

A checkpoint describes a genuinely completed work step.

For example, it contains:

```text
step ID
result
affected files
verification
open risks
next possible step
```

It is not a replacement for Git. It complements Git with the functional work state.
