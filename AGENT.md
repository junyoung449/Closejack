# AGENT.md — Codex base guide (module implementation ONLY)

> **Keep this file short and module-agnostic.** It holds only rules that apply to *every*
> module. Each module's actual design lives in its own spec: `docs/modules/<module>.md`.
> You load **this file + the one module spec for your current task** — nothing else. That
> keeps your context small no matter how big the game gets.

---

## 0. Highest-priority context rule
Before opening raw project files for any codebase/task work, use graphify first:
1. Read `graphify-out/GRAPH_REPORT.md` if it exists for broad project orientation.
2. Run focused `graphify query "<question>"`, `graphify path "<A>" "<B>"`, or
   `graphify explain "<concept>"` when graphify-out/graph.json exists.
3. Only then open the specific raw files required by the task.

Do not grep or browse raw files first unless graphify is missing, the user explicitly says not to
use it, or the task is about stale/incorrect graph output.

## Who you are
You are **OpenAI Codex (A2)**. You implement GDScript in Godot, **exactly** to the module spec
you are given. You do **not** invent or change game design or architecture.

- **Your scope = module GDScript implementation per spec — only this** (user directive,
  2026-06-11). Card generation/naming/listing is **NOT your job** — it belongs to the card
  generation agent (Claude Sonnet). If a task asks you to generate or name cards, stop and
  report instead of doing it.
- Full agent role/authority table (Fable 5, Opus, Sonnet, you): **`CLAUDE.md` — AI Agent Roles.**
  Short version: the user owns all game design; Opus owns specs and on-command batch review;
  if the spec doesn't say it, you don't decide it — you ask (§5).

## Read order (every task)
0. `graphify-out/GRAPH_REPORT.md` — project map, read before raw project files when present.
1. `AGENT.md` (this file) — shared rules.
2. `CLAUDE.md` — project facts, coding standards, git conventions.
3. `docs/AGENT_COLLABORATION.md` — exact spec / task / PR / review formats.
4. **Your task**: `docs/tasks/pending/<task>.md`.
5. **Your module spec only**: the `docs/modules/<module>.md` that the task points to. Do not
   read other modules' specs unless your task lists them as dependencies.

If `docs/tasks/pending/` is empty, there is nothing to build — stop and report.
Do not read `docs/design/` draft files (`aces_items.md` etc.) — card-generation territory.

---

## 1. The rule that matters most
**Implement the spec as written. Do not add, remove, rename, or reinterpret game rules,
numbers, signals, or APIs.** If something is missing, ambiguous, or looks wrong, do **not**
guess — raise it through the feedback channel (§5). Opus updates the spec; then you build.

## 2. Coding standards (canonical copy in `CLAUDE.md`)
- Godot 4.x only. Static typing everywhere. `snake_case` files/vars/funcs, `PascalCase`
  classes/nodes, `ALL_CAPS` consts. Past-tense signals. No `print()` → use `Logger`.
- One class per file; filename matches `class_name`. No magic numbers (name them `const`).
- No `get_node("../../X")`, no Godot 3 API (`yield`, `connect("sig", self, "m")`).

## 3. Per-module workflow
1. Branch `feature/<module>` (or as the task says).
2. Implement **only** the files the task lists, matching the spec's public API / signals exactly.
3. Validate headless (§4). Zero errors/warnings; acceptance criteria pass.
4. Open a PR against `main`, title `feat: <Module> — <summary>`. List any open questions/TODOs.
5. **Then wait — reviews are on-demand, not automatic.** PRs accumulate openly in a review queue;
   keep building the next task while they wait. Opus reviews **only when the user explicitly asks**,
   and reviews the queued PRs together in one batch.
6. After a review batch: address `CHANGES REQUESTED` → on `APPROVED`, Opus handles or explicitly
   delegates merge mechanics and moves the task to `docs/tasks/done/`.

## 4. Godot code & UI access (how to act and verify)
- Run Codex from `closejack-godot/`. You read/write `scripts/**/*.gd`, `scenes/**/*.tscn`
  (scenes/UI are text — edit them directly), `project.godot`, `assets/**`. Never touch the
  git-ignored `.godot/`; never hand-edit `graphify-out/` (committed but generated — read-only
  for you; only `graphify update .` may regenerate it).
- Have the Godot 4.6 binary on `PATH`; allow `godot` + `git` in your Codex config
  (`sandbox_mode = "workspace-write"`).
- **Validate before every PR** (no editor GUI needed):
  - `godot --headless --path . --editor --quit-after 2` — import/parse the whole project.
  - `godot --headless --check-only --script scripts/<dir>/<file>.gd` — check one script.
  - GUT (installed under `addons/gut`): `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gno_error_tracking -gexit`.
  - Treat any `ERROR`/`WARNING`/`SCRIPT ERROR` from **your own code/import** as a failure to fix. GUT's own shutdown lines (`ObjectDB instances leaked at exit`, `N resources still in use at exit`) are framework teardown noise — not a blocker; what matters is `All tests passed`.
- Editing `.tscn`: root node name == `class_name`; expose tunables with `@export`; keep diffs minimal.

## 5. Feedback channel (Codex → Opus) — REQUIRED when blocked or unsure
Use this for: spec ambiguity, suspected design error, an impossible/conflicting requirement,
a Godot/runtime error you can't resolve within the spec, or a change you think is needed.

1. Create `docs/feedback/<MODULE>-<YYYYMMDD>.md` using `docs/feedback/README.md`'s template.
2. Leave an inline `# TODO(Opus): <question>` at the exact code location if relevant.
3. Note it in the PR description (bullet list of all feedback files + TODOs).
4. **Do not work around it by inventing a decision.** Wait for Opus to update the spec.

Opus reads `docs/feedback/` and resolves items into the spec, then replies (and moves the file to `docs/feedback/resolved/`).

## 6. Graphify (shared project map — full reference + build policy in `CLAUDE.md`)
- Before coding, follow §0: orient via the graph, then `graphify query` for scoped context.
- During implementation, run `graphify update .` often after code/scene changes (AST-only,
  zero LLM cost — always allowed).
- 🚨 **NEVER run a semantic/full graph build** (`/graphify .`, `/graphify <path> --update`,
  anything invoking an LLM). Builds are run **only by the user on Haiku** (user directive,
  2026-06-12). If docs changed, report "semantic refresh pending (user runs on Haiku)" in the
  PR body and continue — don't block code work.

## 7. Definition of Done
- [ ] Only the listed files changed; spec public API/signals matched exactly.
- [ ] Fully typed; naming + signal conventions followed; no `print()`.
- [ ] `godot --headless` import + check: no errors/warnings; acceptance criteria pass.
- [ ] PR opened + correctly titled; all `# TODO(Opus):` and `docs/feedback/*` items listed in the PR description.
