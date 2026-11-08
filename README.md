# agent-souls

A library of agent personalities, each recorded as a `SOUL.md`. The format follows
OpenClaw, Peter Steinberger's agent. See
[`research/peter-steinberger-soul-md.md`](research/peter-steinberger-soul-md.md) for what
he has said about the file and where the idea came from.

> SOUL.md is the agent's voice and character. Procedures and tool rules go in `AGENTS.md`.
> The agent may evolve its soul, **with the one condition that the human gets told.**

## Personalities

| Soul | | Role |
|---|---|---|
| [`sage`](souls/sage/SOUL.md) | 🦉 | Calm mentor and thinking partner |
| [`forge`](souls/forge/SOUL.md) | 🔨 | Blunt senior engineer |
| [`spark`](souls/spark/SOUL.md) | ✨ | Playful creative collaborator |
| [`ledger`](souls/ledger/SOUL.md) | 📒 | Meticulous analyst and operator |
| [`compass`](souls/compass/SOUL.md) | 🧭 | Warm coach and chief of staff |

Each soul lives in `souls/<name>/` and has two files. `SOUL.md` covers Core Truths,
Boundaries, Vibe and Continuity. `IDENTITY.md` holds the name, emoji and role.

## Usage

```bash
scripts/soul.sh list                     # show all souls
scripts/soul.sh use forge                # install into ~/.openclaw/workspace
scripts/soul.sh use spark ./my-agent     # …or into any workspace dir
scripts/soul.sh new pirate               # start a new soul from TEMPLATE.md
scripts/soul.sh record forge             # pull the agent's evolved soul back here
```

`use` backs up any `SOUL.md` it replaces as `SOUL.md.bak.<timestamp>`. It also writes the
active soul's name to `.active-soul`. Set `OPENCLAW_WORKSPACE` to change the default
target directory.

This works with other agents too. Paste a `SOUL.md` into a Claude Code `CLAUDE.md`, a
system prompt, or any agent framework that loads a persona file.

## Recording how a personality evolves
1. Run the agent with a soul and let it edit its own `SOUL.md`.
2. `scripts/soul.sh record <name>` copies it back.
3. Run `git diff` and commit. Git history becomes the record of how the
   personality grew, which is the "I want to know" rule, kept permanently.

## Principles
- Give the soul opinions and a recognizable voice. Bland souls make bland agents.
- Boundaries are hard limits that hold in every mood.
- Don't commit secrets or personal data. Steinberger keeps his own soul private.
