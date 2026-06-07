# Module: Hand

## Purpose
One player hand (upper or lower): holds up to 5 cards filled left-to-right, and computes
weight/value totals, bust state, and the bust-collapsed effective value. Pure logic.

## Class
- **class_name**: `Hand`
- **file**: `scripts/logic/hand.gd`
- **type**: RefCounted

## Dependencies
- `Card`

## Public API
| Member | Type | Description |
|--------|------|-------------|
| `const MAX_SLOTS := 5` | const | Slots per hand |
| `const CENTER_SLOT_INDEX := 2` | const | The center (3rd) slot, 0-based |
| `var weight_limit: int = 21` | property | Weight cap (default 21; may vary per design) |
| `func slot_cards() -> Array[Card]` | method | Current cards in slot order (left→right); returns a copy |
| `func card_count() -> int` | method | Number of cards currently placed |
| `func can_add() -> bool` | method | `card_count() < MAX_SLOTS` |
| `func is_full() -> bool` | method | `card_count() == MAX_SLOTS` |
| `func add_card(card: Card) -> bool` | method | Place `card` in the next leftmost empty slot. Returns `false` if the hand is already full (card not added). |
| `func center_card() -> Card` | method | Card at `CENTER_SLOT_INDEX`, or `null` if that slot is empty |
| `func total_weight() -> int` | method | Sum of placed cards' `weight` |
| `func total_value() -> int` | method | Sum of placed cards' `value` |
| `func is_exact_weight() -> bool` | method | `total_weight() == weight_limit` |
| `func is_bust() -> bool` | method | `total_weight() > weight_limit` |
| `func effective_value() -> int` | method | If `is_bust()`: the center card's `value` (or `0` if the center slot is empty). Otherwise `total_value()`. |
| `func clear() -> void` | method | Remove all cards (reuse the hand next turn) |

## Implementation Notes
- **Left-to-right fill**: `add_card` appends, so a card's slot index == the prior `card_count`. There is **no reordering/swapping** in this module (slot-swap is a future special Hole Card, not yet designed).
- **Bust collapse**: on bust, only the center (3rd) slot's value counts — that is exactly what `effective_value()` returns. If a hand busts with fewer than 3 cards (center slot empty), `effective_value()` is `0`. The *visual* "non-center slots destroyed until end of turn" is turn/controller state — **out of scope here**; `Hand` only computes the value.
- Fully statically typed; `snake_case`; no `print()`.

## Out of scope (do NOT implement here — later modules / not yet designed)
- Golden coins, the ×1.5 multiplier, and Ace / card-art coin sources.
- Combining the two hands into attack power (`upper.value × lower.value`) → a future **ScoringEngine**.
- Slot **swapping / repositioning** (special Hole Card — not yet designed).
- Deck / combat-deck (copy vs original, temporary vs permanent changes) → unrelated to `Hand`.

## Acceptance Criteria
- [ ] `add_card` fills left-to-right; the 6th `add_card` returns `false` and does not add.
- [ ] `total_weight()` / `total_value()` are correct sums; empty hand returns `0` for both.
- [ ] `is_exact_weight()` is true iff `total_weight() == weight_limit`.
- [ ] `is_bust()` is true iff `total_weight() > weight_limit`.
- [ ] `effective_value()`: non-bust → `total_value()`; bust with a center card → that card's `value`; bust with empty center slot → `0`.
- [ ] `weight_limit` is configurable and is respected by `is_bust()` / `is_exact_weight()`.
- [ ] `clear()` empties the hand. No Godot editor errors/warnings; GUT unit tests cover all the above.
