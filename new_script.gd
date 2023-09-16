extends KinematicBody  # Use KinematicBody for 3D, or RigidBody2D for 2D

var speed = 5
var camera_reference: Camera  # Reference to the camera
var sensitivity = 0.2  # Adjust this to control the mouse sensitivity
var rot_x = 0  # Initialize rotation angles
var rot_y = 0
var globalthing = "res://global.gd"

func _ready():
	# Get a reference to the camera
	camera_reference = $Camera  # Replace 'Camera' with the actual path to your camera

func _physics_process(event):
	var input_vector = Vector3()  # Use Vector2() for 2D

	# Get user input
	if Input.is_action_pressed("ui_up"):
		input_vector.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.z += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1

	# Convert input_vector to global coordinates
	input_vector = self.global_transform.basis.xform(input_vector)

	# Apply camera rotation to the input vector
	var camera_transform = camera_reference.global_transform
	var camera_rotation = camera_transform.basis
	input_vector = camera_rotation.xform(input_vector)

	# Normalize input_vector and apply speed
	input_vector = input_vector.normalized() * speed

	# Move the player
	move_and_slide(input_vector, Vector3(0, 1, 0))  # Use move_and_slide(input_vector, Vector2(0, 1)) for 2D

func play(event, is_game_paused):
	if not is_game_paused:
		if event is InputEventMouseMotion:
		# Calculate the mouse movement
			var delta = event.relative

	   # Update the rotation angles
			rot_x -= delta.y * sensitivity
			rot_y -= delta.x * sensitivity

			# Limit the vertical rotation to avoid flipping the camera
			rot_x = clamp(rot_x, -90, 90)

	   # Rotate the camera by setting its rotation property
			rotation_degrees = Vector3(rot_x, rot_y, 0)
