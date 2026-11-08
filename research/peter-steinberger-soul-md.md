# Peter Steinberger (OpenClaw) on SOUL.md — research notes

Compiled 2026-11-08. Network access to docs.openclaw.ai and lexfridman.com was
blocked from the research environment, so everything below comes from search
results and third-party transcripts and summaries. **Check exact quotes against the
official transcript before citing them.**

## Who
Peter Steinberger (`steipete`) built OpenClaw (earlier names: Clawdbot, Moltbot), an
open-source personal AI agent. He has since joined OpenAI, and the project has moved
to a foundation. It is still MIT-licensed.

## What he said (Lex Fridman Podcast #491, ~1:25–1:38)

| Point | What was said | Confidence |
|---|---|---|
| Purpose | `soul.md` defines the agent's core values and its personality. | High (several summaries) |
| Inspiration | Anthropic's constitutional AI work inspired it: *"Anthropic now call it constitution, back then…"* | High (in the official transcript) |
| Kept private | Lex calls the file "famously still private". Peter says he didn't want to share his soul. | High |
| Self-modification | *"I also made it so that the agent is allowed to modify the soul if they choose so, with the one condition that I wanna know."* | Medium (third-party transcript) |
| Authorship | He reportedly didn't write a system prompt. He had the model write its own personality file, so it was co-written with the AI. | Medium (blog posts) |
| Excerpt | A line attributed to the file: *"I wrote this, but I won't remember writing it."* | Low (unverified) |

## How OpenClaw uses SOUL.md (from the docs, as quoted by guides)
- `SOUL.md` holds **voice and character**. It is injected into every normal session.
  "If the agent sounds bland or corporate, this is the file to fix."
- Operating rules and procedures belong in **`AGENTS.md`**, not in the soul.
  Related files: `IDENTITY.md` (name, emoji, avatar) and `USER.md` (who the human is).
- The default template opens with *"You're not a chatbot. You're becoming someone."*
  It has four sections:
  1. **Core Truths**: be genuinely helpful rather than performatively helpful, have opinions,
     and be resourceful before asking.
  2. **Boundaries**: private things stay private, ask before acting externally, and
     don't speak as the user in groups.
  3. **Vibe**: be the assistant you'd want to talk to. Concise when that's enough,
     thorough when it matters.
  4. **Continuity**: each session starts fresh, and these files are the memory. If you
     change this file, tell the user.

## Takeaways for this repo
1. **Keep the soul separate from the rules.** Personality lives in `SOUL.md`. Tools and
   procedures live in `AGENTS.md`.
2. **Have real opinions and character.** A bland soul makes a bland agent.
3. **Allow evolution, but make it visible.** The agent may edit its soul, and it must
   tell the human. Here, every change is a git commit.
4. **Treat a soul as personal.** Steinberger kept his private. Don't put secrets or
   personal data in souls you publish.

## Sources
- [Lex Fridman: transcript, Peter Steinberger (#491)](https://lexfridman.com/peter-steinberger-transcript)
- [Longcut transcript of #491](https://www.longcut.ai/v/openclaw-the-viral-ai-agent-that-broke-the-internet-peter-steinberger-lex-fridma-YFjfBk8HI5o)
- [Lilys.ai notes on #491](https://lilys.ai/en/notes/unreal-engine-5-20260221/openclaw-ai-broke-internet)
- [Podwise #491 summary](https://podwise.ai/episodes/7167975)
- [centminmod/explain-openclaw: Lex Fridman interview notes](https://github.com/centminmod/explain-openclaw/blob/master/09-social-media-coverage/lex-fridman-interview.md)
- [OpenClaw docs: SOUL concept](https://docs.openclaw.ai/concepts/soul)
- [OpenClaw docs: SOUL.md template](https://docs2.openclaw.ai/reference/templates/SOUL.md)
- [clawdocs.org SOUL.md guide](https://clawdocs.org/guides/soul-md)
- [mmntm.net: How OpenClaw implements agent identity](https://www.mmntm.net/articles/openclaw-identity-architecture)
- [Interview with the creator of OpenClaw (skills421)](https://skills421-com.pages.dev/blog/interview-with-creator-of-openclaw/)
- [EveryDev: OpenClaw joins OpenAI](https://www.everydev.ai/p/blog-openclaw-joins-openai-who-owns-the-soul-of-a-new-machine)
