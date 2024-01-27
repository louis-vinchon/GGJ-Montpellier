extends RayCast2D

var target 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass




func _on_player_character_initiate_interaction():
	
	if (is_colliding()):
		
		if (get_collider().is_in_group("interaction")):
			
			target = get_collider()
			
			print("can interact")
			
			pass
		else :
			
			target = null
			
	else :
		
		target = null
		
	
	if (target != null):
		
		target.emit_signal("interactionStarted")
		
	
	pass # Replace with function body.
