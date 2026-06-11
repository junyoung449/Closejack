# AGENTS.md

Codex auto-loads this file on start. The full base guide is **`AGENT.md`** — read it first,
then `CLAUDE.md` and `docs/AGENT_COLLABORATION.md`, then **only your module spec**
(`docs/modules/<module>.md`) for the current task.

➡️ **Start here: [`AGENT.md`](AGENT.md)**

Non-negotiables (detail in `AGENT.md`):
- **Your scope = module GDScript implementation per spec, only** (user directive 2026-06-11).
  Card generation/naming/listing belongs to the card generation agent (Claude Sonnet) — if a
  task asks for it, stop and report.
- Implement the module spec **exactly**. Never invent or change game design — that authority is the user's.
- Load only `AGENT.md` + your one module spec, to keep context small.
- Godot 4.x only, static typing, no `print()` (use `Logger`), past-tense signals.
- Validate headless before every PR: `godot --headless --path . --editor --quit-after 2`.
- Blocked or unsure? Use the **feedback channel** (`docs/feedback/`) — do not guess.

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

When the user types `/graphify`, invoke the `skill` tool with `skill: "graphify"` before doing anything else.

Rules:
- Project override: `AGENT.md` requires reading `graphify-out/GRAPH_REPORT.md` before raw project files for codebase/task work, then using scoped graph commands before opening only the needed raw files.
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- Dirty graphify-out/ files are expected after hooks or incremental updates; dirty graph files are not a reason to skip graphify. Only skip graphify if the task is about stale or incorrect graph output, or the user explicitly says not to use it.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
- 🚨 NEVER run semantic/full graph builds (`/graphify .`, `/graphify <path> --update`) — builds are
  run only by the user on Haiku (directive 2026-06-12, detail in `AGENT.md` §6). Report
  "semantic refresh pending" instead.
