# 3. Setting Up OpenCode

In this setup, OpenCode is the layer between the model and the repository.

The model itself does not know our commands, agents, skills or project rules. OpenCode provides these tools and controls which role gets which permissions.

## Connecting a provider

For built-in cloud providers, the normal entry point is:

```text
/connect
```

Afterwards, an available model can be selected with:

```text
/models
```

For local OpenAI-compatible endpoints, the provider is also described in `opencode.json`.

The template contains complete examples for this:

```text
Template/config/opencode.ollama.example.json
Template/config/opencode.lmstudio.example.json
```

These files are intentionally examples. Model ID, host and port have to match your own environment.

## Project configuration

For this workflow, `opencode.json` lives in the project root.

Example:

```text
my-project/
├── opencode.json
├── AGENTS.md
├── .opencode/
└── .project/
```

That way, the project configuration travels with the repository.

Credentials obviously do not belong in the repository.

## First start

After configuration, I start OpenCode from the project root.

The first thing I check is not some arbitrary code change. I check whether the workflow is available:

```text
/help-workflow
```

or:

```text
/work-status
```

If commands and agents are recognized, the technical foundation is there.

## Why not configure everything globally?

Global settings make sense for personal preferences.

Project rules, project agents and workflow files should live in the repository. Otherwise the project only works on the machine where I happened to maintain my personal OpenCode configuration.

For handover and reproducibility, that would be exactly the wrong direction.
