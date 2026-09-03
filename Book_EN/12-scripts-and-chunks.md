# 12. Scripts and Chunks – The LLM Does Not Need to Do Everything

An LLM is good at evaluating relationships and dealing with unclear information.

It is not automatically the best tool for every loop, every file search and every preprocessing task.

That is why classic scripts are explicitly part of my workflow.

## What scripts should handle

For example:

```text
inventory files
filter files
prepare logs
extract sections
split large sources into chunks
collect metadata
validate intermediate results
```

That has three advantages:

1. deterministic behavior,
2. reproducible results,
3. less unnecessary context.

## Example

Instead of giving a model 500 files:

```text
Read everything and find the relevant places.
```

a script can first identify candidates.

The model then receives only:

```text
12 relevant files
+ short metadata
+ concrete task
```

## Why several scripting languages?

The template considers:

```text
Shell
Batch
PowerShell
Python
```

Not because every task needs four implementations, but because projects run on different platforms.

For simple POSIX workflows, Shell is often enough.

For Windows environments, PowerShell or Batch can be practical.

For more complex cross-platform processing, I like using Python.

## Chunks

For large documents or data sources, I prefer a workflow like this:

```text
prepare source
→ split it into useful chunks
→ process exactly one chunk
→ persist the result
→ load the next chunk
```

That keeps context small and prevents completed work from being regenerated in every session.

The template contains neutral examples under `examples/` and helper scripts under `scripts/`.
