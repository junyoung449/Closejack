class_name Deck
extends RefCounted

var _draw_pile: Array[Card] = []
var _discard_pile: Array[Card] = []
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()


func setup(cards: Array[Card], rng_seed: int = 0) -> void:
	_draw_pile.clear()
	_discard_pile.clear()

	if rng_seed != 0:
		_rng.seed = rng_seed
	else:
		_rng.randomize()

	for card: Card in cards:
		_draw_pile.append(card.duplicate_card())


func draw_count() -> int:
	return _draw_pile.size()


func discard_count() -> int:
	return _discard_pile.size()


func is_empty() -> bool:
	return _draw_pile.is_empty()


func draw_random() -> Card:
	if _draw_pile.is_empty():
		return null

	var index: int = _rng.randi_range(0, _draw_pile.size() - 1)
	var card: Card = _draw_pile[index]
	_draw_pile.remove_at(index)
	return card


func discard(card: Card) -> void:
	_discard_pile.append(card)


func reshuffle_from_discard() -> void:
	_draw_pile.append_array(_discard_pile)
	_discard_pile.clear()
	_shuffle_draw_pile()


func _shuffle_draw_pile() -> void:
	for index: int in range(_draw_pile.size() - 1, 0, -1):
		var swap_index: int = _rng.randi_range(0, index)
		var card: Card = _draw_pile[index]
		_draw_pile[index] = _draw_pile[swap_index]
		_draw_pile[swap_index] = card
