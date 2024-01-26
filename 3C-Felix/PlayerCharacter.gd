extends RigidBody2D

@export var accelerationPower : float = 1000

var acceleration : Vector2 = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var up = 0
	var down = 0
	var left = 0
	var right = 0
	
	if (Input.is_action_pressed("UP")):
		up = 1
	if (Input.is_action_pressed("DOWN")):
		down = 1
	if (Input.is_action_pressed("LEFT")):
		left = 1
	if (Input.is_action_pressed("RIGHT")):
		right = 1
	
	
	acceleration = Vector2(right - left, down - up) * accelerationPower
	
	
	pass


func _physics_process(delta):
	
	apply_central_force(acceleration)
	
