extends Node2D

var city_level :Node2D
var current_level :Node2D
var levels = {
	 GGJTypes.Level.City: "" # TODO
}

func _ready():
	GGJSignalBus.switch_level.connect(switch_level)
	
	if !levels[GGJTypes.Level.City]:
		push_error("No main city level defined.")
		var city_level = load(levels[GGJTypes.Level.City]).instantiate()
		current_level = current_level

func switch_level(next_level: GGJTypes.Level, spawn: String = GGJTypes.DEFAULT_SPAWN):
	# Fade out the current level.
	var tween = get_tree().create_tween()
	tween.tween_property(current_level, "modulate", Color.BLACK, 0.65)
	
	# Create the next level.
	var next_level_node = load(levels[next_level]).instantiate()
	next_level_node.modulate = Color.BLACK
	
	# Swap the two levels.
	await tween.finished
	remove_child(current_level)
	current_level = next_level_node
	add_child(next_level_node)
	
	# Fade in the next level.
	tween.tween_property(next_level_node, "modulate", Color.WHITE, 0.65)
	next_level_node.spawn_player(spawn)
