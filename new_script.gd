tool
extends Spatial

var current_mode = "desktop"
var desktop_player = null
var vr_player = null

func _ready():
	# Get references to the desktop and VR player nodes
	desktop_player = get_node("desktop")
	vr_player = get_node("vrplayer")
	# Disable the VR player initially
	remove_child(vr_player)
	

func toggle_mode():
	if current_mode == "desktop":
		current_mode = "VR"
		# Disable the desktop player and enable the VR player
		remove_child(desktop_player)
		add_child(vr_player)
		print("Switching to VR mode")
		print("Desktop player visible:", desktop_player.is_visible())
		print("VR player visible:", vr_player.is_visible())
		print("Scene tree:", get_tree().get_root().get_children())
		get_viewport().set_size(Vector2(0, 0))
		
	elif current_mode == "VR":
		current_mode = "desktop"
		# Disable the VR player and enable the desktop player
		remove_child(vr_player)
		add_child(desktop_player)
		print("Switching to desktop mode")
		print("Desktop player visible:", desktop_player.is_visible())
		print("VR player visible:", vr_player.is_visible())
		print("Scene tree:", get_tree().get_root().get_children())
		get_viewport().set_size(get_viewport().get_size())
		
	else:
		print("Error: unknown mode", current_mode)

# Bind the toggle_mode function to the action that triggers the mode change

func _input(event):
	if event.is_action_pressed("vr"):
		toggle_mode()
