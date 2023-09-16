extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _ready():
	hide_menu()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		print("Toggle menu key pressed")
		toggle_menu()

func toggle_menu():
	if self.visible:
		hide_menu()
	else:
		show_menu()

func show_menu():
	print("Showing menu")  # Debug statement
	self.show()
	call_deferred("set_mouse_mode_visible")  # Call set_mouse_mode_visible with a delay

func hide_menu():
	print("Hiding menu")  # Debug statement
	self.hide()
	call_deferred("set_mouse_mode_captured")  # Call set_mouse_mode_captured with a delay

func set_mouse_mode_visible():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Show the mouse cursor

func set_mouse_mode_captured():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Capture the mouse cursor

func _on_OptionButton_pressed():
	pass # Replace with function body.


func _on_CheckBox_pressed():
	print("checkbox pressed i guess?")
