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
- Use GUT if available under `addons/gut`. Run headless:
  `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -gexit`
- If GUT is **not** installed, file a note in `docs/feedback/` (it's an infra/Sonnet prerequisite)
  and instead provide a minimal `tests/run_checks.gd` `SceneTree` script that asserts the
  acceptance criteria and exits non-zero on failure.

## Definition of Done
- [ ] All Acceptance Criteria in both specs pass.
- [ ] Fully statically typed; `snake_case` members; no `print()` (use `Logger` only if ever needed).
- [ ] `godot --headless --path . --editor --quit-after 2` shows no script errors/warnings.
- [ ] Tests pass headless (or feedback filed per the Testing note).
- [ ] PR opened against `main`, title: `feat: Card + Deck — foundational data/logic`, listing any `# TODO(Opus):` or `docs/feedback/*` items.

> Note (from Opus): scope is intentionally minimal and design-free so we can hand off safely while
> the broader module/class architecture is still being designed with the user. The `Hand` module is
> **deferred** until the open question "how do drawn cards map to a hand's 5 slots / what defines the
> center (3rd) slot" is decided (see `docs/PLANNING_TODO.md`).
