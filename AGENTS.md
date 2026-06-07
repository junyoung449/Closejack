# AGENTS.md

Codex auto-loads this file on start. The full base guide is **`AGENT.md`** — read it first,
then `CLAUDE.md` and `docs/AGENT_COLLABORATION.md`, then **only your module spec**
(`docs/modules/<module>.md`) for the current task.

➡️ **Start here: [`AGENT.md`](AGENT.md)**

Non-negotiables (detail in `AGENT.md`):
- Implement the module spec **exactly**. Never invent or change game design — that authority is the user's.
- Load only `AGENT.md` + your one module spec, to keep context small.
- Godot 4.x only, static typing, no `print()` (use `Logger`), past-tense signals.
- Validate headless before every PR: `godot --headless --path . --editor --quit-after 2`.
- Blocked or unsure? Use the **feedback channel** (`docs/feedback/`) — do not guess.
