# 13. Analyzing Existing Projects

For an existing project, my first question to AI is not:

```text
How would you rebuild this today?
```

It is:

```text
How does this project actually work?
```

That is a big difference.

## Observe first

I first want to know:

- Where does the application start?
- Which modules exist?
- Which dependencies exist?
- Which conventions are visible?
- Which boundaries are documented?
- Which parts are even relevant to the current task?

For example, the workflow provides:

```text
/repo-inventory
/project-context
```

plus technology-specific context retrievers.

## No wishful architecture

A static helper does not automatically become a Repository Pattern, Unit of Work, CQRS and a new project structure just because a model considers that architecture prettier.

For existing software, the rule is:

> Plan against the repository as it is, not as the agent thinks it should be.

Architecture changes are separate decisions and require separate approval.

## Windows code on Linux

Source code can often be analyzed perfectly well on Linux even if the application ultimately runs on Windows.

But analysis, buildability and executability are different things.

A Windows-specific framework, native dependencies or operating-system APIs can mean that the code can be read and understood on Linux but cannot be built or executed completely there.

Then the result should say exactly that.

Not:

```text
The project is broken.
```

but, for example:

```text
Static analysis is possible.
A complete build requires the Windows target environment.
```

That distinction matters.
