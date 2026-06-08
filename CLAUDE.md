# Closejack — CLAUDE.md

## Project
- **Game**: Closejack (2D blackjack-variant card game)
- **Engine**: Godot 4.6 · GDScript · 2D
- **Target**: Steam (Windows)
- **Repo**: https://github.com/junyoung449/Closejack
- **Local root**: `closejack-godot/`

---

## AI Agent Roles

| Agent | Role | Must NOT |
|-------|------|----------|
| **Claude Opus** | Write GDD, architecture, module specs, issue tasks to Codex, review Codex PRs, own project participation/delegation authority | Write implementation code |
| **OpenAI Codex** | Implement GDScript per module spec | Make architectural decisions |
| **Claude Sonnet** | Optional delegated assistance only when Opus or the user explicitly assigns a specific task | Act with standing project authority, review authority, infra authority, merge authority, or design authority |

> **Design authority**: The game's internal logic and design belong solely to the **user**.
> Opus only advises and records the user's decisions — it never invents game design.
> **Review authority**: The user explicitly instructed on 2026-06-08 that Opus owns code review
> authority.
> **Participation authority**: The user explicitly instructed on 2026-06-08 that Sonnet's project
> participation authority is transferred to Opus. Sonnet may assist only when Opus or the user
> explicitly delegates a specific task.

---

## Workflow

```
[Opus] writes spec → docs/modules/<module>.md
         ↓
[Codex] implements → scripts/<system>/<module>.gd   (branch: feature/<module>)
         ↓
[Opus] reviews    → comments or approves
         ↓
[Opus] merges or explicitly delegates merge mechanics
```

> **Reviewing a Codex PR — always read the GitHub PR body**, not just the local diff. Run `gh pr view <branch>` (or `gh pr view <#>`); Codex reports its validation results, graphify status, and open TODOs/feedback there, so skipping it breaks communication. `gh` is installed (`C:\Program Files\GitHub CLI`, on PATH) and authenticated as `junyoung449`.

### Task Lifecycle
- **Pending tasks**: `docs/tasks/pending/<task>.md` — written by Opus, read by Codex
- **Done tasks**: move file to `docs/tasks/done/` after merge
- **Module specs**: `docs/modules/<module_name>.md` — permanent reference

### Planning backlog (always maintain)
- **`docs/PLANNING_TODO.md`** is the running design backlog. **Every session: read it, give the user a short status, and keep it current** — check off/remove completed items, add new ones as they arise. (A `SessionStart` hook surfaces this reminder.)

---

## Project Structure

```
closejack-godot/
├── CLAUDE.md
├── docs/
│   ├── KO_설계도.md            # Korean GDD (human-readable) — maintained by Opus
│   ├── AGENT_COLLABORATION.md  # Agent protocol details
│   ├── modules/                # Module specs for Codex (authored by Opus)
│   └── tasks/
│       ├── pending/            # Tasks waiting for Codex
│       └── done/               # Completed tasks
├── scenes/
│   ├── game/                   # Gameplay scenes
│   ├── ui/                     # HUD, menus
│   └── cards/                  # Card visuals
├── scripts/
│   ├── core/                   # Game logic (CardSystem, GameManager, etc.)
│   ├── systems/                # Subsystems (Audio, Save, Steam)
│   └── ui/                     # UI controllers
├── assets/
│   ├── sprites/
│   ├── fonts/
│   └── audio/
└── addons/                     # Godot plugins (e.g., GodotSteam)
```

---

## GDScript Coding Standards

- **Godot 4.x API only** — no deprecated 3.x patterns
- **Static typing** required: `var score: int = 0`, `func deal() -> Card:`
- Naming: `snake_case` variables/functions/files, `PascalCase` class names & node names, `ALL_CAPS` constants
- Signal names: past tense (`card_dealt`, `round_ended`, `game_over`)
- One class per file; filename must match class name (`card_system.gd` → `class_name CardSystem`)
- No `print()` in game logic — use a `Logger` autoload
- Autoloads (singletons): `GameManager`, `AudioManager`, `SaveSystem`

---

## Git Conventions

- `main` — stable reviewed code only; direct commits forbidden
- `feature/<module-name>` — one branch per Codex task
- `docs/<topic>` — documentation updates by Opus
- Commit prefix: `feat:` / `fix:` / `chore:` / `docs:` / `refactor:`
- Every merge to `main` requires a PR reviewed by Claude Opus; Opus handles or explicitly delegates merge mechanics

---

## Graphify

Shared knowledge graph of this repo (`graphify-out/`), used by Opus and Codex as the
common project map. Built in two passes: **AST** (Tree-sitter, local, no LLM) + **semantic**
(LLM/agent extracts concepts & relationships from docs/code). Outputs: `graph.json`,
`GRAPH_REPORT.md`, `graph.html`.

**Build / rebuild**
- `/graphify .` — full build/rebuild of the current directory.
- `/graphify <path> --update` — incremental; re-extracts only changed files (SHA256-cached).

**Automatic rebuilds**
- `graphify hook install` — git post-commit hook. After each commit it re-runs **AST on changed
  *code* files** and rebuilds `graph.json` + `GRAPH_REPORT.md`. (`hook status` / `hook uninstall`.)
- ⚠️ The hook **ignores doc/image changes**. After editing GDD/specs (`docs/**`), rebuild the
  semantic layer manually with `/graphify . --update` — it needs an LLM pass, so it is not fully automatic.
- `/graphify <path> --watch` — real-time structural re-sync while editing.

**Always-on (agents auto-consult the graph)** — installed via `graphify claude install` (also registers PreToolUse hooks in `.claude/settings.json`); `graphify install --platform codex` does the same for Codex. Standing behavior for agents:
- For codebase questions, run `graphify query "<question>"` first (when `graphify-out/graph.json` exists); use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for a focused node — these return a small scoped subgraph.
- Read `graphify-out/GRAPH_REPORT.md` only for broad architecture review, or when query/path/explain don't surface enough context.
- After modifying code, run `graphify update .` (AST-only, no API cost).

**Query (no rebuild needed)**
- `/graphify query "<question>"` · `/graphify path "<A>" "<B>"` · `/graphify explain "<node>"`

> Setup: `pip install graphifyy` (Python 3.10+). Here it runs via `uv tool` (`uv tool dir`).
> `graphify-out/` is git-ignored. Keep the graph honest — rebuild after structural or design-doc changes.

---

## Key Design Constraints

> **Content below is a placeholder. The user decides these; Opus records them after asking.**

- [ ] Core variant rule (what makes Closejack different from standard Blackjack)
- [ ] Win/lose conditions
- [ ] Player count (single-player vs multiplayer)
- [ ] Monetization / Steam features (achievements, leaderboards, DLC)
