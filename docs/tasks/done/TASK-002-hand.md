# Task: TASK-002 — Hand (single-hand logic)

## Assigned to: Codex
## Spec: docs/modules/hand.md
## Branch: feature/hand

## Objective
Implement the `Hand` pure-logic class: a single hand of up to 5 cards filled **left-to-right**,
with weight/value totals, exact-weight and bust detection, and the bust-collapsed
`effective_value()` (on bust only the center / 3rd slot counts). Derived directly from confirmed
rules in `docs/KO_설계도.md` §2-3..2-5 — no game-design decisions required or allowed.

## Files to create / modify
- `scripts/logic/hand.gd` — create (`class_name Hand`, RefCounted)
- `tests/unit/test_hand.gd` — create (unit tests)

## Do NOT
- Do not change files outside the listed paths. No autoloads, scenes, or UI.
- Do **not** implement (out of scope / not yet designed):
  - golden coins, the ×1.5 multiplier, Ace / card-art coin sources,
  - combining the two hands into attack power (a future `ScoringEngine`),
  - slot **swapping / repositioning** (future special Hole Card — not designed),
  - any **deck / combat-deck** logic, including the "combat deck = copy of original" and
    temporary-vs-permanent deck changes (still in design — see `docs/PLANNING_TODO.md`).
- Do not invent fields/behavior beyond the spec. If something is missing/ambiguous, use the
  feedback channel (`docs/feedback/`) — do not guess.

## Testing
- GUT is installed under `addons/gut`. Canonical headless command:
  `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gno_error_tracking -gexit`
- Acceptable noise: GUT's own teardown lines (`ObjectDB instances leaked at exit`, `N resources still in use at exit`) are framework shutdown noise, not a blocker. What matters: `All tests passed`.

## Definition of Done
- [x] All Acceptance Criteria in `docs/modules/hand.md` pass.
- [x] Fully statically typed; `snake_case` members; no `print()`.
- [x] Project's own scripts import cleanly (GUT-framework teardown warnings excepted).
- [x] GUT unit tests pass headless — full suite 16/16 (71 asserts), Hand 9/9.
- [x] Implemented on `feature/hand` (commit `056b37c`).

## Review (Opus) — APPROVED
- Verified by code inspection + headless GUT run on Godot 4.6.3 (`godot` now on PATH): **16/16 pass, exit 0**.
- `hand.gd` matches the spec exactly: left-to-right fill, `center_card()` (null when <3 cards), configurable `weight_limit`, `is_exact_weight`/`is_bust`, `effective_value()` (bust → center value, 0 if empty center), `slot_cards()` returns a copy, `clear()`.
- Out-of-scope items (coins/multiplier/Ace/art, hand-combination, slot-swap, combat-deck) correctly omitted.
- Verdict: **APPROVED** — merged to `main`.

> Note (from Opus): **Combat-deck content is intentionally NOT in this task.** "Combat deck = copy
> of original / temporary vs permanent changes" and "slot-swap Hole Card" are still in design and
> live in `docs/PLANNING_TODO.md`; they will become their own tasks once the user finalizes them.
> This task is the single-hand structural logic only.
