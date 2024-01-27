@tool

class_name LevelSwitcher
extends Area2D

@export var next_level :GGJTypes.Level
@export var next_level_spawn :String

func _get_configuration_warnings():
	var warnings :PackedStringArray = []
	
	if not next_level:
		warnings.append("A LevelSwitcher needs to be configured with a level (other than None).")
	
	return warnings
	
func _ready():
	if !next_level_spawn:
		next_level_spawn = GGJTypes.DEFAULT_SPAWN

func _on_body_entered(body):
	#if body is Player:
	GGJSignalBus.switch_level.emit(next_level, next_level_spawn)
