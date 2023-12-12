extends Control

onready var tree = get_tree()
#const MyScene = preload("res://materials/menu/main/mainscene.tscn")

onready var title = $TitleScreen
onready var start = $StartGame
onready var options = $Options

var vr_scene_path = "res://mainscene.tscn"  # Replace with your VR scene path
var desktop_scene_path = "res://mainscene.tscn"  # Replace with your desktop scene path

var vr_player_path = "res://vrplayer.tscn"  # Replace with your VR player path
var desktop_player_path = "res://player/player.tscn"  # Replace with your desktop player path

func change_scene_to_file(scene_path):
	var scene = load(scene_path)
	tree.change_scene(scene)

func _on_Start_pressed():
	start.visible = true
	title.visible = false

func _on_Options_pressed():
	options.prev_menu = title
	options.visible = true
	title.visible = false

func _on_Exit_pressed():
	tree.quit()

func _on_RandomBlocks_pressed():
# warning-ignore:unused_variable
	var desktop_scene = load(desktop_scene_path)
	tree.change_scene(desktop_scene_path)  # Convert scene path to string
	var desktop_player = load(desktop_player_path).instance()
	get_node("/root").add_child(desktop_player)

func _on_FlatGrass_pressed():
# warning-ignore:unused_variable
	var vr_scene = load(vr_scene_path)
	tree.change_scene(vr_scene_path)  # Convert scene path to string
	var vr_player = load(vr_player_path).instance()
	get_node("/root").add_child(vr_player)

func _on_BackToTitle_pressed():
	title.visible = true
	start.visible = false
