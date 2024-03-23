extends CharacterBody3D

# cube that allows it to snap to a grid when it is close enough to it

func _ready():
	set_process(true)

func _process(delta):
	var snap_distance = 0.1
	var snap_position = Vector3(
		round(position.x / snap_distance) * snap_distance,
		round(position.y / snap_distance) * snap_distance,
		round(position.z / snap_distance) * snap_distance
	)
	position = snap_position
	# snap rotation
	rotation_degrees = Vector3(
		round(rotation_degrees.x / 90) * 90,
		round(rotation_degrees.y / 90) * 90,
		round(rotation_degrees.z / 90) * 90
	)
