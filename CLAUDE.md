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
| **Claude Opus** | Write GDD, architecture, module specs, issue tasks to Codex | Write implementation code |
| **OpenAI Codex** | Implement GDScript per module spec | Make architectural decisions |
| **Claude Sonnet** | Infra (git/GitHub/Graphify), code review, merging | Write game logic or design docs |

---

## Workflow

```
[Opus] writes spec → docs/modules/<module>.md
         ↓
[Codex] implements → scripts/<system>/<module>.gd   (branch: feature/<module>)
         ↓
[Sonnet] reviews  → comments or approves
         ↓
         merge to main
```

### Task Lifecycle
- **Pending tasks**: `docs/tasks/pending/<task>.md` — written by Opus, read by Codex
- **Done tasks**: move file to `docs/tasks/done/` after merge
- **Module specs**: `docs/modules/<module_name>.md` — permanent reference

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
- Every merge to `main` requires a PR reviewed by Claude Sonnet

---

## Graphify

After significant structural changes, run `/graphify .` to rebuild the knowledge graph.  
Both Sonnet and Codex can query it with `/graphify query "<question>"`.

---

## Key Design Constraints

> **Content below is a placeholder. Claude Opus fills this section after writing the GDD.**

- [ ] Core variant rule (what makes Closejack different from standard Blackjack)
- [ ] Win/lose conditions
- [ ] Player count (single-player vs multiplayer)
- [ ] Monetization / Steam features (achievements, leaderboards, DLC)
