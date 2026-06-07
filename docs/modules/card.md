# Module: Card

## Purpose
Data model for a single Closejack card (the weight/value + kind that every card carries).

## Class
- **class_name**: `Card`
- **file**: `scripts/logic/card.gd`
- **type**: Resource

## Dependencies
- none (pure data; no nodes, no autoloads)

## Public API
| Member | Type | Description |
|--------|------|-------------|
| `enum Kind { PLAYING, HOLE, ACE }` | enum | Card category (플레잉 / 홀 / 에이스) |
| `@export var id: StringName` | property | Stable unique id for this card definition (e.g. `&"playing_w5_v8"`) |
| `@export var display_name: String` | property | Human-readable name shown in UI |
| `@export var kind: Kind = Kind.PLAYING` | property | Which of the three categories |
| `@export var weight: int = 0` | property | 무게 — counts toward a hand's weight limit (default limit 21) |
| `@export var value: int = 0` | property | 가치 — contributes to attack value |
| `@export var art_id: StringName = &""` | property | Id of the central picture/effect; **effect logic is out of scope for this task** (placeholder only) |
| `func duplicate_card() -> Card` | method | Returns an independent copy (so instances in a deck don't share state) |

## Implementation Notes
- Pure `Resource`. No `print()` (use `Logger` only if logging is ever needed — not expected here).
- `weight` and `value` are independent on purpose: a card may have low weight but high value, etc. Do not couple them.
- `art_id` is a label only in this task. Do **not** implement any card effect behavior — that is a separate, later module. Leave a `# TODO(Opus): card effects` if tempted.
- Keep everything statically typed.

## Acceptance Criteria
- [ ] `Card` is a `Resource` with the exact properties above, all statically typed and `@export`ed where listed.
- [ ] `Kind` enum present with `PLAYING, HOLE, ACE`.
- [ ] `duplicate_card()` returns a deep-independent `Card` (modifying the copy does not affect the original).
- [ ] No Godot editor errors/warnings on import.
