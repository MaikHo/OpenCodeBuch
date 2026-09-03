# 10. Agents – Clear Roles and Permissions

I do not want one universal agent that can read everything, change everything, commit everything and redesign the architecture on the side.

Agents therefore get clearly bounded roles.

They live under:

```text
.opencode/agents/
```

## Technology-independent workflow agents

```text
workflow-guide-agent
workflow-syncer
```

`workflow-guide-agent` is the read-only entry point. It explains the workflow and helps choose the right path.

`workflow-syncer` may synchronize the persistent state under `.project/`. It should not modify production code.

## .NET agents

Because these roles are technology-specific, they carry `net-` in the name:

```text
net-openagent
net-context-retriever
net-spec-writer
net-plan-writer
net-coder
net-reviewer
net-documentation
net-doc-syncer
net-editor
net-toolsmith
```

That makes it obvious from the name that the role is not intended for every project.

## C++ agents

The template also contains:

```text
cpp-context-retriever
cpp-coder
cpp-reviewer
```

The same rule applies here: the technology is visible in the name.

## Why different agents?

Because permissions are part of the design.

A reviewer normally does not need write permissions.

A context retriever should analyze, not modify files on the side.

A coder may edit source code, but it should not rewrite the official work state under `.project/` by itself.

The separation is therefore not only organizational. It is also enforced technically through permissions.

## No agent swarms for the sake of it

More agents are not automatically better.

I add a new role only when it has a genuinely different responsibility or needs different permissions.
