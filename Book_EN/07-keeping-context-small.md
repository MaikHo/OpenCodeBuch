# 7. Keeping Context Small

I do not want to constantly ask myself whether the context window is half full, two-thirds full or almost full.

The workflow should solve that problem beforehand.

## The basic idea

Do not load everything and then try to compress it later. Load only what the current step actually needs from the beginning.

A normal entry sequence therefore looks roughly like this:

```text
AGENTS.md
↓
.project/activeContext.md
↓
.project/work/current.yaml
↓
active spec / active plan, if present
↓
required project context
↓
relevant files
```

Not this:

```text
Please read the entire repository and all documentation.
```

## Six things that keep context small

1. `AGENTS.md` stays short.
2. Stable project context lives in `.project/`.
3. `activeContext.md` contains only the current overview.
4. Skills are loaded only when needed.
5. Scripts pre-filter large amounts of data.
6. One step handles one manageable problem.

## `activeContext.md` is not a log

The file should stay small.

For example:

```markdown
# Active Context

## Current Focus
Adjust import processing.

## Active Specification
.project/specs/active/0012-import.md

## Current Plan
.project/plans/active/0012-import.plan.md

## Current Step
T-003

## Blockers
None.
```

Under "Recently Changed", old entries are replaced instead of being appended forever.

## What about 64k or 128k?

Of course, the configured model still needs enough context for the task.

I personally prefer Qwen3.8:27b with 64k. But I do not design the workflow around filling those 64k as efficiently as possible.

The goal is the opposite: create as little irrelevant context as possible.
