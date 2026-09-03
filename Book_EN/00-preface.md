# Preface

I like using AI while programming. But I still want to know what is happening in my project.

That is exactly how this workflow came about.

I am not interested in letting an agent loose on a repository and hoping afterwards that everything will somehow be fine. I want small, understandable work steps. I want to see why something is being changed. And I want to be able to stop at any time.

The whole workflow was built around OpenCode. The model can run locally or through a cloud provider. I often prefer a local model because it lets me work independently and I know where my data is processed. But that is a preference, not a requirement for this workflow.

## What this book is meant to show

This book does not only explain which files are in the template. What matters more to me is the **why** behind them:

- Why `AGENTS.md` should stay small.
- Why project knowledge must not disappear inside a chat.
- Why I split large tasks into small steps.
- Why the next step always has to be approved deliberately.
- Why agents have different permissions.
- Why scripts should handle work that an LLM does not need to do itself.
- Why a completed step must leave a traceable state in the repository.

The central idea is pretty simple:

> AI should take work off my hands, but it should not take control of the work away from me.

## Book and template

This repository deliberately has two main parts:

```text
Buch/
Book_EN/
Template/
```

The **German book** and the **English book** explain the structure and the decisions behind it.

The **Template** is the practical implementation. If you want to use the workflow, you work with the files from `Template/` inside your own repository.

Both book versions therefore describe the same state that the template actually implements. Examples are just examples and never hidden project defaults.
