extends GutTest


func test_empty_hand_has_zero_totals_and_can_add() -> void:
	var hand: Hand = Hand.new()

	assert_eq(hand.card_count(), 0)
	assert_eq(hand.total_weight(), 0)
	assert_eq(hand.total_value(), 0)
	assert_eq(hand.effective_value(), 0)
	assert_true(hand.can_add())
	assert_false(hand.is_full())
	assert_false(hand.is_exact_weight())
	assert_false(hand.is_bust())
	assert_null(hand.center_card())


func test_add_card_fills_left_to_right_and_returns_copy_of_slots() -> void:
	var hand: Hand = Hand.new()
	var first_card: Card = _make_card(&"first", 1, 10)
	var second_card: Card = _make_card(&"second", 2, 20)

	assert_true(hand.add_card(first_card))
	assert_true(hand.add_card(second_card))

	var cards: Array[Card] = hand.slot_cards()
	cards.clear()

	assert_eq(hand.card_count(), 2)
	assert_eq(hand.slot_cards()[0], first_card)
	assert_eq(hand.slot_cards()[1], second_card)


func test_sixth_add_card_returns_false_and_does_not_add() -> void:
	var hand: Hand = Hand.new()
	for index: int in range(Hand.MAX_SLOTS):
		assert_true(hand.add_card(_make_card(StringName("card_%d" % index), 1, index)))

	var rejected_card: Card = _make_card(&"rejected", 1, 99)

	assert_false(hand.add_card(rejected_card))
	assert_eq(hand.card_count(), Hand.MAX_SLOTS)
	assert_eq(hand.slot_cards()[Hand.MAX_SLOTS - 1].id, &"card_4")
	assert_true(hand.is_full())
	assert_false(hand.can_add())


func test_total_weight_and_value_are_correct_sums() -> void:
	var hand: Hand = Hand.new()
	hand.add_card(_make_card(&"one", 3, 7))
	hand.add_card(_make_card(&"two", 5, 11))
	hand.add_card(_make_card(&"three", 8, 13))

	assert_eq(hand.total_weight(), 16)
	assert_eq(hand.total_value(), 31)
	assert_eq(hand.effective_value(), 31)


func test_exact_weight_and_bust_respect_configurable_weight_limit() -> void:
	var hand: Hand = Hand.new()
	hand.weight_limit = 10
	hand.add_card(_make_card(&"one", 4, 1))
	hand.add_card(_make_card(&"two", 6, 2))

	assert_true(hand.is_exact_weight())
	assert_false(hand.is_bust())

	hand.add_card(_make_card(&"three", 1, 3))

	assert_false(hand.is_exact_weight())
	assert_true(hand.is_bust())


func test_center_card_is_third_slot_when_present() -> void:
	var hand: Hand = Hand.new()
	hand.add_card(_make_card(&"left", 1, 10))
	hand.add_card(_make_card(&"middle_left", 1, 20))
	var center: Card = _make_card(&"center", 1, 30)
	hand.add_card(center)
	hand.add_card(_make_card(&"middle_right", 1, 40))

	assert_eq(hand.center_card(), center)


func test_effective_value_collapses_to_center_value_on_bust() -> void:
	var hand: Hand = Hand.new()
	hand.weight_limit = 10
	hand.add_card(_make_card(&"left", 5, 100))
	hand.add_card(_make_card(&"middle_left", 5, 200))
	hand.add_card(_make_card(&"center", 1, 7))
	hand.add_card(_make_card(&"middle_right", 1, 300))

	assert_true(hand.is_bust())
	assert_eq(hand.total_value(), 607)
	assert_eq(hand.effective_value(), 7)


func test_effective_value_is_zero_when_bust_has_empty_center_slot() -> void:
	var hand: Hand = Hand.new()
	hand.weight_limit = 5
	hand.add_card(_make_card(&"left", 3, 100))
	hand.add_card(_make_card(&"middle_left", 3, 200))

	assert_true(hand.is_bust())
	assert_null(hand.center_card())
	assert_eq(hand.effective_value(), 0)


func test_clear_empties_hand_for_reuse() -> void:
	var hand: Hand = Hand.new()
	hand.add_card(_make_card(&"one", 3, 7))
	hand.add_card(_make_card(&"two", 5, 11))

	hand.clear()

	assert_eq(hand.card_count(), 0)
	assert_eq(hand.slot_cards(), [])
	assert_eq(hand.total_weight(), 0)
	assert_eq(hand.total_value(), 0)
	assert_true(hand.can_add())


func _make_card(card_id: StringName, weight: int, value: int) -> Card:
	var card: Card = Card.new()
	card.id = card_id
	card.display_name = String(card_id)
	card.kind = Card.Kind.PLAYING
	card.weight = weight
	card.value = value
	card.art_id = card_id
	return card
