extends Node2D

@export var selectedDialogue : String


func _on_interaction_spot_interaction_started():
	var dia = Dialogic.start(selectedDialogue)
