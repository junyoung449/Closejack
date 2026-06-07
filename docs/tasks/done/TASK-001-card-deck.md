# Task: TASK-001 — Card + Deck (foundational data/logic)

## Assigned to: Codex
## Spec: docs/modules/card.md, docs/modules/deck.md
## Branch: feature/card-deck

## Objective
Implement the two foundational pure-logic classes the whole game builds on: `Card` (data) and
`Deck` (draw/discard/reshuffle primitives). These are derived **directly from confirmed rules**
in `docs/KO_설계도.md` §2-1, §2-2 — no game-design decisions are required or allowed. When done,
a `Deck` of `Card`s can be set up, drawn from randomly (deterministically with a seed), discarded
to, and reshuffled.

## Files to create / modify
- `scripts/logic/card.gd` — create (`class_name Card`, Resource)
- `scripts/logic/deck.gd` — create (`class_name Deck`, RefCounted)
- `tests/unit/test_card.gd` — create (unit tests)
- `tests/unit/test_deck.gd` — create (unit tests)

## Do NOT
- Do not change files outside the listed paths.
- Do not add autoloads, scenes, or UI.
- Do not implement card **effects**, hands/slots, scoring, enemies, or the turn/reshuffle *rules*
  (those are later modules). Keep `Deck.reshuffle_from_discard()` a primitive only.
- Do not invent fields/behavior beyond the specs. If something seems missing or ambiguous, use the
  feedback channel (`docs/feedback/`) instead of guessing.

## Testing
- GUT is installed under `addons/gut`. Run headless (canonical command — note the subdir + error-tracking flags):
  `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gno_error_tracking -gexit`
  - `-ginclude_subdirs` is required for the `tests/unit/` layout (otherwise GUT reports "Nothing was run").
  - `-gno_error_tracking` avoids GUT 9.6 `error_tracker.gd` logger errors on Godot 4.6.
- **Acceptable noise**: GUT's own teardown may print `ObjectDB instances leaked at exit` / `N resources still in use at exit`. These come from the GUT framework's shutdown, not from `Card`/`Deck`; they are **not** a blocker. What matters: `All tests passed` and that the project's own scripts import cleanly.

## Definition of Done
- [x] All Acceptance Criteria in both specs pass.
- [x] Fully statically typed; `snake_case` members; no `print()` (use `Logger` only if ever needed).
- [x] Project's own scripts import cleanly (GUT-framework teardown leak warnings excepted — see Testing).
- [x] Tests pass headless — 7 tests / 28 asserts, all passing.
- [x] Implemented on `feature/card-deck` (commit `3af8458`).

## Review (Opus) — APPROVED
- Reviewed by code inspection + Codex's headless test logs (Godot not on reviewer PATH).
- `card.gd`, `deck.gd` match the specs' public API exactly; correct typing/naming; `duplicate_card()` is a true deep copy; `Deck` uses a seeded RNG with proper Fisher-Yates; tests cover copy-independence, seed reproducibility, exhaustion (`null`), and discard→reshuffle.
- GUT headless teardown warnings ruled **acceptable** (framework noise, not module defect). Canonical GUT command updated above.
- Verdict: **APPROVED** — ready to merge to `main`.

> Note (from Opus): scope is intentionally minimal and design-free so we can hand off safely while
> the broader module/class architecture is still being designed with the user. The `Hand` module is
> **deferred** until the open question "how do drawn cards map to a hand's 5 slots / what defines the
> center (3rd) slot" is decided (see `docs/PLANNING_TODO.md`).
