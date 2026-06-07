extends GutTest


func test_card_has_specified_defaults() -> void:
	var card: Card = Card.new()

	assert_eq(card.id, &"")
	assert_eq(card.display_name, "")
	assert_eq(card.kind, Card.Kind.PLAYING)
	assert_eq(card.weight, 0)
	assert_eq(card.value, 0)
	assert_eq(card.art_id, &"")


func test_kind_enum_contains_three_card_categories() -> void:
	assert_eq(Card.Kind.PLAYING, 0)
	assert_eq(Card.Kind.HOLE, 1)
	assert_eq(Card.Kind.ACE, 2)


func test_duplicate_card_returns_independent_copy() -> void:
	var original: Card = Card.new()
	original.id = &"playing_w5_v8"
	original.display_name = "Weight 5 Value 8"
	original.kind = Card.Kind.PLAYING
	original.weight = 5
	original.value = 8
	original.art_id = &"center_spark"

	var copy: Card = original.duplicate_card()
	copy.id = &"changed"
	copy.display_name = "Changed"
	copy.kind = Card.Kind.ACE
	copy.weight = 1
	copy.value = 2
	copy.art_id = &"changed_art"

	assert_ne(copy, original)
	assert_eq(original.id, &"playing_w5_v8")
	assert_eq(original.display_name, "Weight 5 Value 8")
	assert_eq(original.kind, Card.Kind.PLAYING)
	assert_eq(original.weight, 5)
	assert_eq(original.value, 8)
	assert_eq(original.art_id, &"center_spark")
