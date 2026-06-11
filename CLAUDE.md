# Closejack — CLAUDE.md

> 🥇 **TOP PRIORITY — consult the knowledge graph FIRST.** Before reading raw source/docs for any
> codebase question, use `graphify query "<question>"` / `explain` / `path` (scoped subgraph), or
> `graphify-out/GRAPH_REPORT.md` for broad orientation. Open raw files only when the graph lacks
> detail or you are editing/debugging specific files. Applies to every agent, every session.
> Full graphify reference: §Graphify below.

## Project
- **Game**: Closejack (2D blackjack-variant roguelike deckbuilder)
- **Engine**: Godot 4.6 · GDScript · 2D · **Target**: Steam (Windows)
- **Languages**: Korean + English (localization target — no hardcoded display strings)
- **Repo**: https://github.com/junyoung449/Closejack · **Local root**: `closejack-godot/`
- **Design source of truth**: `docs/KO_설계도.md` (Korean GDD). Core loop: Red/Blue hand building,
  damage = Red value × Blue value × 1.5^(golden chips), bust at weight > 21 (3rd slot survives),
  win = 8 acts' bosses, lose = HP 0. Details live in the GDD — do not restate them here.

---

## 🧭 Role routing — read ONLY your track

**Identify your role first, then load only that track's documents.** Small-context agents must not
read the whole docs tree.

| If you are… | Your job | Read (in order) | Do NOT read |
|-------------|----------|-----------------|-------------|
| **Claude Sonnet** (card generation) | Generate/name/list card candidates | **`docs/roles/card_generation.md` only** — it lists the rest | modules/, tasks/, AGENT.md, scripts/ |
| **OpenAI Codex** (module implementation) | Implement GDScript per module spec | `AGENTS.md` → `AGENT.md` → your task → your one module spec | design drafts (aces_items 등), other modules' specs |
| **Claude Opus** (design/spec/review) | GDD upkeep, module specs, tasks, batch review on command | this file → `docs/PLANNING_TODO.md` → `docs/AGENT_COLLABORATION.md` + the docs the session needs | — |
| **Claude Fable 5** (full authority) | Anything the user assigns | this file → `docs/PLANNING_TODO.md` → task-relevant docs | — |

## AI Agent Roles & Authority

| Agent | Role | Must NOT |
|-------|------|----------|
| **Claude Fable 5** (A0) | Full-authority agent. Any task the user assigns — design-structure extraction (→ `docs/design/`), spec writing, review, implementation. Its decisions take precedence within user-given scope | Invent game design |
| **Claude Opus** (A1) | GDD, architecture, module specs, task issuance, PR review **on the user's command only** (batch) | Write implementation code; review unprompted |
| **OpenAI Codex** (A2) | **Module GDScript implementation per spec — only this** (user directive 2026-06-11) | Card generation; design/architecture decisions; anything outside the assigned module task |
| **Claude Sonnet** (A3) | **Card generation agent** — candidates, naming, listing, simulation, final YAML. Entry doc: `docs/roles/card_generation.md` | Commit/PR before user approval; edit approved grammar; any work outside card generation |

> **Design authority = the user, always.** Every agent only advises and records the user's
> decisions; none invents game rules/logic/numbers/flow.
>
> **Directive history** (newest wins):
> - **2026-06-11** — Card generation transferred **Codex → Sonnet**; Codex restricted to module
>   coding only (its former Opus-fallback and card-listing duties are retired). This supersedes,
>   for the card-generation scope, the 2026-06-08 directive below.
> - 2026-06-10 — Fable 5 granted full authority. Reviews are on-demand batch only (PRs queue
>   openly; Opus reviews when the user asks).
> - 2026-06-08 — Opus assigned review/participation authority; Sonnet's standing project
>   authority transferred to Opus (now partially superseded — see 2026-06-11).

---

## Workflow — two tracks

**Module implementation track** (Opus ↔ Codex):
```
[Opus] spec → docs/modules/<module>.md
[Codex] implements → scripts/… (branch feature/<module>) → PR → open review queue
[User] commands review → [Opus] batch-reviews → APPROVED → Opus merges (or delegates mechanics)
```
- Reviewing a Codex PR: **always read the GitHub PR body** (`gh pr view <#>`) — validation
  results, graphify status, TODOs live there. `gh` is on PATH, authed as `junyoung449`.
- Tasks: `docs/tasks/pending/` (Opus writes) → `docs/tasks/done/` after merge.
  Superseded tasks → `docs/tasks/superseded/`.

**Card generation track** (user ↔ Sonnet):
```
[User] names an archetype → [Sonnet] drafts unnamed candidates + simulation (aces_items.md)
→ [User] selects survivors → [Sonnet] names + final YAML → docs/design/aces_catalog.md
```
- Workflow law: `docs/design/card_generation_rules.md`. **No commits before user approval.**

### Planning backlog (always maintain)
**`docs/PLANNING_TODO.md`** is the running design backlog. Every Opus/Fable session: read it,
give the user a short status, keep it current. (A `SessionStart` hook surfaces this.)

---

## Project Structure

```
closejack-godot/
├── CLAUDE.md                   # this file — facts, roles, routing
├── AGENTS.md / AGENT.md        # Codex entry / Codex base guide (module coding only)
├── docs/
│   ├── KO_설계도.md             # Korean GDD — DESIGN SOURCE OF TRUTH (Opus/Fable maintain)
│   ├── PLANNING_TODO.md        # design backlog (read every session)
│   ├── AGENT_COLLABORATION.md  # spec/task/PR/review formats + coding quick-ref
│   ├── ASSET_WORKFLOW.md       # image asset process
│   ├── roles/
│   │   └── card_generation.md  # Sonnet entry doc (card generation track)
│   ├── design/                 # data-design structures (Fable) + card drafts/catalog (Sonnet)
│   │   ├── README.md           # who writes what here
│   │   ├── card_generation_rules.md  # mandatory card-gen workflow + rules briefing
│   │   ├── aces.md             # APPROVED ace grammar (user-locked)
│   │   ├── aces_items.md       # working drafts + simulations
│   │   └── aces_catalog.md     # accumulated final YAML
│   ├── modules/                # module specs for Codex (Opus authors)
│   ├── tasks/                  # pending/ · done/ · superseded/
│   └── feedback/               # agent → reviewer escalation channel (template in README)
├── scenes/  (game/ ui/ cards/)
├── scripts/ (core/ systems/ ui/)
├── assets/  (sprites/ fonts/ audio/)
└── addons/  (gut, …)
```

---

## GDScript Coding Standards (canonical copy)

- **Godot 4.x API only** — no deprecated 3.x patterns (`yield`, string-based `connect`)
- **Static typing** required: `var score: int = 0`, `func deal() -> Card:`
- Naming: `snake_case` vars/funcs/files, `PascalCase` classes & nodes, `ALL_CAPS` constants
- Signals: past tense (`card_dealt`, `round_ended`)
- One class per file; filename matches `class_name` (`card_system.gd` → `CardSystem`)
- No `print()` — use the `Logger` autoload. No magic numbers — named `const`.
- No `get_node("../../X")` — `@onready` or signals
- Autoloads: `GameManager`, `AudioManager`, `SaveSystem`
- Formats, review checklist, forbidden patterns: `docs/AGENT_COLLABORATION.md`

## Git Conventions

- `main` — stable reviewed code only; direct commits forbidden
- Branches: `feature/<module>` (Codex tasks) · `docs/<topic>` (docs) · `fix/…` · `chore/…`
- Commit prefixes: `feat:` / `fix:` / `chore:` / `docs:` / `refactor:`
- Every merge to `main` = PR reviewed by Opus (on user command); Opus merges or delegates
- **Card-generation drafts are never committed before user approval**

---

## Graphify (canonical reference)

Shared knowledge graph at `graphify-out/` (git-ignored). Two passes: **AST** (local, no LLM) +
**semantic** (LLM over docs/code). Outputs: `graph.json`, `GRAPH_REPORT.md`, `graph.html`.

- **Query first** (no rebuild needed): `graphify query "<question>"` ·
  `graphify path "<A>" "<B>"` · `graphify explain "<node>"` — small scoped subgraphs.
  `GRAPH_REPORT.md` only for broad architecture review.
- **After code changes**: `graphify update .` (AST-only, free, run often).
- **After docs/design changes**: `/graphify . --update`. Semantic pass per the skill
  (`~/.claude/skills/graphify/SKILL.md` — authoritative usage): uses `GEMINI_API_KEY`/
  `GOOGLE_API_KEY` if set; otherwise **a Claude Code session dispatches extraction subagents
  itself** (no other API key is read). Only Codex (which cannot dispatch Claude subagents)
  must report "semantic refresh pending" when no key is available.
- Hooks: git post-commit hook rebuilds AST for code; PreToolUse/SessionStart hooks in
  `.claude/settings.json` nudge graph-first reading. Dirty `graphify-out/` files are normal.
- Setup: `pip install graphifyy` (here via `uv tool`). `/graphify .` = full rebuild.
