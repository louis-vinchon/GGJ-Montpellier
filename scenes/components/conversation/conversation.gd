@tool

class_name Conversation
extends Node2D

signal conversation_finished

@export var dialogic_timeline: String

var precedent_character :DialogicCharacter

func _get_configuration_warnings():
	var warnings :PackedStringArray = []
	
	if not dialogic_timeline:
		warnings.append("This conversation needs to be configured with a dialogic timeline.")
	
	# TODO: check that it's a valid dialogic timeline.
	
	return warnings
	
func trigger():
	# https://dialogic-docs.coppolaemilio.com/dialogic-signals.html
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.Text.speaker_updated.connect(_on_speaker_change)
	
	Dialogic.start(dialogic_timeline)

# https://dialogic-docs.coppolaemilio.com/dialogic-signals.html
func _on_timeline_ended():
	print("dialogue finished")
	conversation_finished.emit()
	
# https://dialogic-docs.coppolaemilio.com/dialogic-signals.html
func _on_speaker_change(character :DialogicCharacter):
	if precedent_character:
		_get_character_portrait_node(precedent_character).modulate = Color.GRAY
	
	_get_character_portrait_node(character).modulate = Color.WHITE
	precedent_character = character

func _get_character_portrait_node(character :DialogicCharacter) -> Node2D:
	return Dialogic.Portraits.get_character_info(character).node
