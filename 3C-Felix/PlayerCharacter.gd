extends RigidBody2D

@export var accelerationPower : float = 3000
@export var rotationSpeed : float = 1000

var acceleration : Vector2 = Vector2(0,0)
var RotationIncreased : float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var forwardInput = 0
	
	if (Input.is_action_pressed("UP")):
		forwardInput += 1
	if (Input.is_action_pressed("DOWN")):
		forwardInput -= 1
	
	var rotateInput = 0
	
	if (Input.is_action_pressed("LEFT")):
		
		rotateInput -= 1
		pass
	if (Input.is_action_pressed("RIGHT")):
		rotateInput += 1
		pass
	
	RotationIncreased = delta * rotateInput * rotationSpeed
	
	acceleration = transform.x * forwardInput * accelerationPower * delta
	
	
	pass


func _physics_process(delta):
	
	apply_torque(RotationIncreased)
	
	apply_central_force(acceleration)
	
