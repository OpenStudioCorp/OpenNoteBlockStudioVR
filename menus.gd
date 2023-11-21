extends Node

var vr = false
var desktop = false

var vr_scene_path = "res://Spatial.tscn"  # Replace with your VR scene path
var desktop_scene_path = "res://Spatial.tscn"  # Replace with your desktop scene path

var vr_player_path = "res://vrplayer.tscn"  # Replace with your VR player path
var desktop_player_path = "res://player/player.tscn"  # Replace with your desktop player path

func _ready():
	pass

func _on_vr_pressed():
	vr = true
	desktop = false
	get_tree().change_scene_to_file(vr_scene_path)
	var vr_player = load(vr_player_path).instantiate()
	get_node("/root").add_child(vr_player)

func _on_desktop_pressed():
	desktop = true
	vr = false
	get_tree().change_scene_to_file(desktop_scene_path)
	var desktop_player = load(desktop_player_path).instantiate()
	get_node("/root").add_child(desktop_player)



