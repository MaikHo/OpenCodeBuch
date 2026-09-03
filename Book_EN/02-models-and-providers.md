# 2. Models and Providers: Local or Cloud

The workflow is not tied to one specific model.

OpenCode can use local models, but it can also use cloud providers. That matters because the right model depends on the task and on the environment.

## My preferred local setup

I like working with **Qwen3.8:27b**, and I deliberately assign only **64k context** to the model in my setup.

That is my configuration, not a requirement of the template.

Why not simply configure the largest context window possible? Because my workflow is designed to avoid unnecessarily large context in the first place. Project knowledge lives in the repository, skills are loaded when needed, large inputs are preprocessed, and work is split into small steps.

So for me the more useful question is not:

```text
How full can the context window get?
```

but:

```text
Why should I load this information into the context right now?
```

## Ollama

Ollama is especially practical for me when I want models to be available reproducibly on a local machine or on my own server.

A typical local endpoint is:

```text
http://localhost:11434/v1
```

OpenCode can connect to Ollama through its OpenAI-compatible endpoint.

## LM Studio

LM Studio is convenient on a workstation when I want to load models through a graphical interface, try them out, and expose them through a local API server.

A typical endpoint is:

```text
http://127.0.0.1:1234/v1
```

Here as well, OpenCode communicates with an OpenAI-compatible API afterwards.

## Cloud providers

Local is my preferred operating mode, but it is not a belief system.

OpenCode supports many providers. That includes OpenAI and therefore Codex/OpenAI models. In OpenCode, the connection is typically created with:

```text
/connect
```

Available models can then be selected with:

```text
/models
```

For OpenAI, OpenCode currently supports authentication through ChatGPT Plus/Pro or through an API key.

That means the same project workflow can start with a local Qwen model and later continue with a cloud model. The work state still remains in the repository.

That is exactly why I try to keep as little model-specific knowledge as possible hidden inside prompts.

## So which option is right?

There is no single answer.

I would decide based on questions like these:

- Are the project data allowed to leave the local environment?
- Is the local hardware sufficient for the model I want to use?
- How important are speed and tool-calling quality?
- Do I want to work independently of a cloud service?
- Would a stronger cloud model make sense for a difficult task?

The workflow stays the same either way.
