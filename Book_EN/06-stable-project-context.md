# 6. Stable Project Context

Project knowledge should not have to be rediscovered from source code every time.

That is what `.project/` is for.

## Stable knowledge

The most important files are:

```text
.project/projekt.md
.project/architecture.md
.project/entscheidungen.md
.project/tech.md
.project/tasks.md
.project/bugs.md
.project/context/repository.md
.project/context/architecture-fingerprint.yaml
```

The filenames stay as they are in the template. They are part of the actual workflow structure, even in this English book.

### `projekt.md`

Describes the purpose, boundaries and domain scope of the project.

### `architecture.md`

Contains the more detailed technical architecture and its relationships.

### `entscheidungen.md`

This is where real decisions belong, including their rationale and source.

Not this:

```text
This was probably done for performance reasons.
```

If the reason is unknown, then it is unknown.

### `tech.md`

Contains technologies, runtime, important tools and technical constraints.

### `repository.md`

Contains the compact technical inventory of the existing repository.

## Architecture fingerprint

The file:

```text
.project/context/architecture-fingerprint.yaml
```

is not a second architecture document.

It is a small navigation map for agents:

```yaml
architecture:
  style: "<architecture style>"
  entrypoints:
    - "<entry point>"
  modules:
    - "<module>"
  boundaries:
    - "<important boundary>"
```

That means an agent does not have to reconstruct the complete architecture for every small task.

## Observed is not the same as decided

Architecture knowledge is separated into four states:

```text
Observed
Decided
Unknown
Conflict
```

**Observed** means: I can prove this from the repository.

**Decided** means: There is a documented decision and source for it.

**Unknown** means: The reason is not documented.

**Conflict** means: Two sources contradict each other. In that case, the more convenient version is not simply chosen.

This distinction matters especially in older projects. Code shows **what** was done. It does not automatically explain **why** it was done that way.

## Maintenance instead of a documentation graveyard

Project context should contain current knowledge, not every intermediate state from the last three years.

Completed work belongs in checkpoints, plans, Git and the changelog. Stable knowledge stays in the project context.
