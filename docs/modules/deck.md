# Module: Deck

## Purpose
Holds a player's draw pile and discard pile, and provides the primitive operations the combat
loop needs: draw a random card, discard, and reshuffle the discard pile back into the draw pile.

## Class
- **class_name**: `Deck`
- **file**: `scripts/logic/deck.gd`
- **type**: RefCounted

## Dependencies
- `Card` — the elements stored in the piles

## Public API
| Member | Type | Description |
|--------|------|-------------|
| `func setup(cards: Array[Card], rng_seed: int = 0) -> void` | method | Initialize the draw pile with `cards` (copies), empty the discard pile. If `rng_seed != 0`, seed the RNG for deterministic tests; otherwise randomize. |
| `func draw_count() -> int` | method | Number of cards remaining in the draw pile |
| `func discard_count() -> int` | method | Number of cards in the discard pile |
| `func is_empty() -> bool` | method | `true` when the draw pile has no cards |
| `func draw_random() -> Card` | method | Remove and return one uniformly-random card from the draw pile. Returns `null` if the draw pile is empty. |
| `func discard(card: Card) -> void` | method | Put `card` onto the discard pile |
| `func reshuffle_from_discard() -> void` | method | Move **all** discard-pile cards into the draw pile, then shuffle the draw pile. Discard pile becomes empty. |

## Implementation Notes
- Pure `RefCounted`. No nodes, no autoloads, no `print()`.
- Use an internal `RandomNumberGenerator` so tests can seed it via `setup(..., rng_seed)`. Same seed + same operations ⇒ same draw order.
- `draw_random()` must remove the drawn card from the draw pile (not just peek).
- **Out of scope (do NOT implement here)** — these belong to a later combat-controller module:
  - The turn rule that *reshuffle is only allowed when 0 cards were drawn that turn*, and that reshuffling forfeits the turn. `Deck` only exposes `reshuffle_from_discard()` as a primitive; it does not enforce when it may be called.
  - Hand/slot logic, scoring, enemies.
- All members statically typed; `Array[Card]` typed arrays.

## Acceptance Criteria
- [ ] `Deck` is a `RefCounted` exposing the exact API above, statically typed.
- [ ] `setup()` with a fixed `rng_seed` makes `draw_random()` order reproducible (verified by test).
- [ ] `draw_random()` returns `null` and `is_empty()` is `true` once the draw pile is exhausted.
- [ ] After `discard()`-ing N cards and calling `reshuffle_from_discard()`, `draw_count()` increases by N and `discard_count()` is 0.
- [ ] No Godot editor errors/warnings on import.
