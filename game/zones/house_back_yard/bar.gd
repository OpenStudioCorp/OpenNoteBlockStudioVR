
# bar script that detects whether a cube has passed into it and triggers a function on the cube

extends CharacterBody3D

var cube = null
var start_pos = Vector3(-0.473, 0, 0.688)
var end_pos = Vector3(1, 0, 1)
var direction = Vector3.ZERO

func _ready():
	pass

func _process(delta):
	# check if the user pressed x on the vr controller
	if Input.is_action_pressed("fire"):
		# get the start position of the bar
		start_pos = self.global_transform.origin
		# move the bar
		move_bar(true)
	else:
		pass

func move_bar(start):
	if start == true:
		while true:
			if self.global_transform.origin.x < end_pos.x:
				self.global_transform.origin.x += 1
			else:
				direction.x = start_pos.x
				break
		

func _on_area_entered(area):
	if area.is_in_group("cube"):
		cube = area
		cube.trigger()
		cube = null
