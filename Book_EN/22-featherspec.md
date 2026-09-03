# 22. FeatherSpec as a Source of Ideas

My OpenCode workflow is not FeatherSpec, and it is not supposed to become FeatherSpec.

The existing setup with `AGENTS.md`, agents, skills, commands, project context, small approved steps and controlled work was already there.

But while looking at FeatherSpec, a few ideas stood out that sharpened this approach in useful ways.

Most importantly:

- a deliberately small active context,
- persistent plans instead of plan knowledge living only in chat,
- clear evidence for every step,
- a compact architecture fingerprint,
- a clean distinction between observed, decided, unknown and conflicting architecture knowledge.

These concepts were not copied 1:1. They were adapted to the existing OpenCode workflow.

For me, the most important difference remains the deliberate control boundary between steps:

```text
work on one step
→ verify it
→ synchronize state
→ STOP
→ wait for the next approval
```

## Thank you

A special thank you goes to **Gregor Biswanger** for FeatherSpec.

Looking at FeatherSpec helped me sharpen several ideas in my own OpenCode workflow, especially around persistent plans, compact working context, verifiable work steps and an honest way of handling architecture knowledge.

FeatherSpec was not adopted here as a system. The ideas that fit this workflow were deliberately selected, simplified and adapted to the OpenCode approach that was already in place.

**Thanks for the inspiration, Gregor.**
