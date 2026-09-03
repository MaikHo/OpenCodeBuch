# 4. Setting Up the Project and Template

The template is not a project generator that is supposed to take over my repository. It is a collection of workflow files that I deliberately integrate into a new or existing project.

## The two most important areas

After integration, I mainly care about:

```text
.opencode/
.project/
```

plus:

```text
AGENTS.md
```

`.opencode/` describes the controls and the roles.

`.project/` stores the persistent project and work state.

`AGENTS.md` contains the overarching working rules.

## Do not blindly overwrite existing files

Especially in an existing repository, files like these may already exist:

```text
README.md
.gitignore
AGENTS.md
```

They are not simply replaced. Relevant content is merged deliberately.

This matters especially for `AGENTS.md`, because project-specific rules may already be present there.

## What is copied from the template

The complete workflow lives under:

```text
Template/.opencode/
Template/.project/
Template/docs/
Template/scripts/
```

Technical configuration examples live under:

```text
Template/config/
```

Afterwards, the appropriate example configuration is copied to the project root as `opencode.json` and adapted.

## Why copy the complete template first?

Commands reference agents and skills. Picking individual files from the start is therefore more error-prone than adopting the complete workflow first.

Later I can deliberately remove components I truly do not need.

That is different from copying half a structure and then wondering why a command cannot find its agent.
