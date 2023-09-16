extends KinematicBody

var camera_rotation_speed_horizontal = 0.001
var camera_rotation_speed_vertical = 0.1
var move_speed = 5.0
var max_camera_rotation = deg2rad(4000.0)  # Adjust this value to set the maximum camera tilt

var camera
var is_moving = false

var held_item = null

func _ready():
	camera = $Camera

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var rotation_horizontal = -event.relative.x * camera_rotation_speed_horizontal
		var rotation_vertical = -event.relative.y * camera_rotation_speed_vertical
		
		rotate_y(rotation_horizontal)
		
		# Rotate the camera on the x-axis, clamping the angle
		var current_rotation_x = camera.rotation_degrees.x
		var new_rotation_x = clamp(current_rotation_x + rotation_vertical, -max_camera_rotation, max_camera_rotation)
		camera.rotation_degrees.x = new_rotation_x
	
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_ESCAPE:  # Capture/uncapture the mouse
				if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				else:
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if held_item == null:
					var ray_start = camera.global_transform.origin
					var ray_end = ray_start + camera.global_transform.basis.z.normalized() * 5.0  # Adjust the length of the raycast
					
					var query_layers = [2]  # Layer 2 represents interactable objects
					
					var space_state = get_world().direct_space_state

					var ray_result = space_state.intersect_ray(ray_start, ray_end, query_layers)
					
					if ray_result:
						var picked_object = ray_result.collider
						if picked_object is RigidBody:
							held_item = picked_object
							picked_object.mode = RigidBody.MODE_STATIC
							picked_object.global_transform.origin = ray_result.position
							picked_object.linear_velocity = Vector3(0, 0, 0)
							picked_object.angular_velocity = Vector3(0, 0, 0)
				else:
					if held_item is RigidBody:
						held_item.mode = RigidBody.MODE_RIGID
						held_item = null

func _process(_delta):
	var grav_strength = 0.4
	var jump_height = 10

	var move_direction = Vector3()
	var grav = 0
	var vel = Vector3.ZERO


	
	if is_on_floor():
		grav = 0
		vel.y = -grav_strength
	else:
		grav += grav_strength


	if Input.is_action_pressed("move_forward"):
		move_direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		move_direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		move_direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		move_direction += transform.basis.x
	
	move_direction = move_direction.normalized()
	
	if is_moving and move_direction == Vector3():
		is_moving = false
		if held_item is RigidBody:
			held_item.mode = RigidBody.MODE_RIGID
			held_item = null
	elif not is_moving and move_direction != Vector3():
		is_moving = true
	
	move_and_slide(move_direction * move_speed)



