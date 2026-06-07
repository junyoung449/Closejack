extends GutTest


func test_setup_copies_cards_and_counts_draw_pile() -> void:
	var source_card: Card = _make_card(&"source", 3, 7)
	var cards: Array[Card] = [source_card]
	var deck: Deck = Deck.new()

	deck.setup(cards, 100)
	source_card.id = &"mutated"

	var drawn: Card = deck.draw_random()

	assert_eq(deck.draw_count(), 0)
	assert_eq(deck.discard_count(), 0)
	assert_eq(drawn.id, &"source")


func test_fixed_seed_makes_draw_order_reproducible() -> void:
	var first_deck: Deck = Deck.new()
	var second_deck: Deck = Deck.new()
	var cards: Array[Card] = _make_cards(8)

	first_deck.setup(cards, 12345)
	second_deck.setup(cards, 12345)

	var first_order: Array[StringName] = _draw_all_ids(first_deck)
	var second_order: Array[StringName] = _draw_all_ids(second_deck)

	assert_eq(first_order, second_order)


func test_draw_random_exhausts_draw_pile() -> void:
	var deck: Deck = Deck.new()
	deck.setup(_make_cards(2), 7)

	var first_card: Card = deck.draw_random()
	var second_card: Card = deck.draw_random()
	var third_card: Card = deck.draw_random()

	assert_not_null(first_card)
	assert_not_null(second_card)
	assert_null(third_card)
	assert_true(deck.is_empty())
	assert_eq(deck.draw_count(), 0)


func test_discard_and_reshuffle_moves_cards_to_draw_pile() -> void:
	var deck: Deck = Deck.new()
	deck.setup([], 42)

	deck.discard(_make_card(&"discard_1", 1, 2))
	deck.discard(_make_card(&"discard_2", 2, 3))
	deck.reshuffle_from_discard()

	assert_eq(deck.draw_count(), 2)
	assert_eq(deck.discard_count(), 0)
	assert_false(deck.is_empty())


func _make_cards(count: int) -> Array[Card]:
	var cards: Array[Card] = []
	for index: int in range(count):
		cards.append(_make_card(StringName("card_%d" % index), index + 1, index + 2))
	return cards


func _make_card(card_id: StringName, weight: int, value: int) -> Card:
	var card: Card = Card.new()
	card.id = card_id
	card.display_name = String(card_id)
	card.kind = Card.Kind.PLAYING
	card.weight = weight
	card.value = value
	card.art_id = card_id
	return card


func _draw_all_ids(deck: Deck) -> Array[StringName]:
	var ids: Array[StringName] = []
	while not deck.is_empty():
		var card: Card = deck.draw_random()
		ids.append(card.id)
	return ids
