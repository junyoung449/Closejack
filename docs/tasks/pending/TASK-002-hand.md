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
- [ ] All Acceptance Criteria in `docs/modules/hand.md` pass.
- [ ] Fully statically typed; `snake_case` members; no `print()`.
- [ ] Project's own scripts import cleanly (GUT-framework teardown warnings excepted).
- [ ] GUT unit tests pass headless.
- [ ] PR opened against `main`, title: `feat: Hand — single-hand logic`, listing any `# TODO(Opus):` or `docs/feedback/*` items.

> Note (from Opus): **Combat-deck content is intentionally NOT in this task.** "Combat deck = copy
> of original / temporary vs permanent changes" and "slot-swap Hole Card" are still in design and
> live in `docs/PLANNING_TODO.md`; they will become their own tasks once the user finalizes them.
> This task is the single-hand structural logic only.
