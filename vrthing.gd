extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():


	#check if vr is supported then set vr to false
	if OS.has_feature("vr"):
		OS.vr_mode = false
	else:
		OS.vr_mode = false
		print("VR not supported")
		#show error
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_switch_pressed():
	# start vr
	OS.vr_mode = true
	# spawn player

	var vrplayer = preload("res://vrplayer.tscn").instance()
	#check if player is already in scene
	if get_tree().root.has_node(vrplayer.get_path()):
		print("player already in scene")
		return
	else:
		get_tree().root.add_child(vrplayer)
		vrplayer.translation = Vector3(0, 1.6, 0)
	
	#setup desktop if vr button is pressed again
	#check if player is in scene
	
	if get_tree().root.has_node(vrplayer.get_path()):
		get_tree().root.remove_child(vrplayer)
		OS.vr_mode = false
		print("vr mode off")
		var desktop = preload("res://player/player.tscn").instance()
		get_tree().root.add_child(desktop)
	else:
		print("vr mode already off")


