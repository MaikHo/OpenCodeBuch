# 17. The Workflow as a Whole

Up to this point, the individual building blocks were explained separately. Now they come together.

## Small piece of work

```text
requirement
↓
/implement-change
↓
analysis
↓
small change
↓
verification
↓
review / diff
↓
STOP
```

I do not need a large planning apparatus for that.

## Larger piece of work

```text
requirement
↓
/create-spec-to-plan
↓
spec proposal
↓
my approval
↓
plan proposal
↓
my approval
↓
/work-start
↓
/work-status
↓
/next-step T-001
↓
implementation
↓
verification
↓
/complete-step T-001
↓
STOP
```

T-002 does not start automatically afterwards.

I can inspect the state first:

```text
/work-status
```

and then deliberately approve:

```text
/next-step T-002
```

## Why operate it this way?

Because it makes the workflow visible.

I do not need to remember which agent updates which file internally. That is what commands are for.

At the same time, I can always inspect `.project/` and see the current state myself.

For me, that is the right middle ground between convenient operation and understandable mechanics.
