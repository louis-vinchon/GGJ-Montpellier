extends RigidBody2D

@export var accelerationPower : float = 3000
@export var rotationSpeed : float = 1000

@onready var audiostreamplayer :AudioStreamPlayer = $AudioStreamPlayer

@onready var sideView : Texture = load("res://assets/graph/car/car_side.png")
@onready var frontView : Texture = load("res://assets/voiture_face.PNG")
@onready var backView : Texture = load("res://assets/voiture_dos.PNG")

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
	
	if (Input.is_action_just_pressed("interact")):
		
		print("vroom")
		emit_signal("initiateInteraction")
	
	RotationIncreased = delta * rotateInput * rotationSpeed
	
	acceleration = transform.x * forwardInput * accelerationPower * delta
	
	
	if (rotation_degrees < 60 && rotation_degrees > -60):
		
		$Sprite2D.flip_h = false
		
		$Sprite2D.texture = sideView
		
		
		
	elif (rotation_degrees < -60 && rotation_degrees > -120):
		
		$Sprite2D.texture = backView
		
		
		
	elif (rotation_degrees < 120 && rotation_degrees > 60):
		
		$Sprite2D.texture = frontView
		
	else :
		
		$Sprite2D.flip_h = true
		
		$Sprite2D.texture = sideView
		
		pass
	
	$Sprite2D.global_rotation = 0
	
	play_sounds()

func play_sounds():
	if linear_velocity.length() > 0:
		# Play sound.
		#audiostreamplayer.play()
		#audiostreamplayer.stream = load("path to other mp3")
		pass
	else:
		# audiostreamplayer.stop()
		pass


func _physics_process(delta):
	
	apply_torque(RotationIncreased)
	
	apply_central_force(acceleration)
	

signal initiateInteraction
