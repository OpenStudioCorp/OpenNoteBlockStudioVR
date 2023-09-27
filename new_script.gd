extends Node


func _ready():
	if OS.get_name() == "Android":
		# Show the menu
		var menu = load("res://menu.tscn").instance()
		add_child(menu)
	else:
		pass

func create_desktop_player():

	var desktop = preload("res://player/player.tscn").instance()

	get_tree().root.remove_child(get_tree().root.get_node("vrplayer"))
	get_tree().root.add_child(desktop)

	

func create_vr_player():
	print("vr")
	var vrplayer = preload("res://vrplayer.tscn").instance()

	get_tree().root.remove_child(get_tree().root.get_node("desktop"))
	get_tree().root.add_child(vrplayer)
	vrplayer.translation = Vector3(0, 1.6, 0)

func _input(event):
	if event.is_action_pressed("vr"):
		create_vr_player()
		if get_tree().root.has_node("desktop"):
			create_vr_player()
		elif get_tree().root.has_node("vrplayer"):
			create_desktop_player()
			
		print("vr")
