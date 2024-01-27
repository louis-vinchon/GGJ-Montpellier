@tool

class_name LevelSwitcher
extends Area2D

@export var next_level :Types.Level

func _get_configuration_warnings():
	var warnings :PackedStringArray = []
	
	if not next_level:
		warnings.append("A LevelSwitcher needs to be configured with a level (other than None).")
	
	return warnings

func _on_body_entered(body):
	#if body is Player:
	SignalBus.switch_level.emit(next_level)
