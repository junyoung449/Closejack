class_name Hand
extends RefCounted

const MAX_SLOTS := 5
const CENTER_SLOT_INDEX := 2

var weight_limit: int = 21

var _cards: Array[Card] = []


func slot_cards() -> Array[Card]:
	return _cards.duplicate()


func card_count() -> int:
	return _cards.size()


func can_add() -> bool:
	return card_count() < MAX_SLOTS


func is_full() -> bool:
	return card_count() == MAX_SLOTS


func add_card(card: Card) -> bool:
	if is_full():
		return false

	_cards.append(card)
	return true


func center_card() -> Card:
	if card_count() <= CENTER_SLOT_INDEX:
		return null

	return _cards[CENTER_SLOT_INDEX]


func total_weight() -> int:
	var total: int = 0
	for card: Card in _cards:
		total += card.weight
	return total


func total_value() -> int:
	var total: int = 0
	for card: Card in _cards:
		total += card.value
	return total


func is_exact_weight() -> bool:
	return total_weight() == weight_limit


func is_bust() -> bool:
	return total_weight() > weight_limit


func effective_value() -> int:
	if not is_bust():
		return total_value()

	var card: Card = center_card()
	if card == null:
		return 0

	return card.value


func clear() -> void:
	_cards.clear()
