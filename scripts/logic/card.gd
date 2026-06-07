class_name Card
extends Resource

enum Kind { PLAYING, HOLE, ACE }

@export var id: StringName = &""
@export var display_name: String = ""
@export var kind: Kind = Kind.PLAYING
@export var weight: int = 0
@export var value: int = 0
@export var art_id: StringName = &""


func duplicate_card() -> Card:
	var card: Card = Card.new()
	card.id = id
	card.display_name = display_name
	card.kind = kind
	card.weight = weight
	card.value = value
	card.art_id = art_id
	return card
