# 14. LSP, Compiler and Build Are Not the Same Thing

These tools provide different kinds of information.

## LSP

A Language Server helps with things like:

```text
symbol resolution
references
definitions
type information
diagnostics while editing
```

For agents, this is useful because relationships can be found more precisely than with plain text search alone.

## Compiler

The compiler answers a different question:

```text
Is this code syntactically and semantically compilable for the selected target?
```

An LSP diagnostic is not a replacement for the compiler.

## Build

A build often includes even more:

```text
project resolution
dependencies
code generation
resources
platform-specific steps
```

That is why LSP can work while a build is not possible in the current environment.

## Why this matters in the workflow

If a step defines `dotnet build`, `cmake --build ...` or another build command as its verification, then that exact command must actually have been executed before `Verified: PASSED` is recorded.

An agent must not infer from clean LSP diagnostics that the build will probably be fine.
